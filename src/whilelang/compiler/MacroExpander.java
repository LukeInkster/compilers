// This file is part of the WhileLang Compiler (wlc).
//
// The WhileLang Compiler is free software; you can redistribute
// it and/or modify it under the terms of the GNU General Public
// License as published by the Free Software Foundation; either
// version 3 of the License, or (at your option) any later version.
//
// The WhileLang Compiler is distributed in the hope that it
// will be useful, but WITHOUT ANY WARRANTY; without even the
// implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
// PURPOSE. See the GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public
// License along with the WhileLang Compiler. If not, see
// <http://www.gnu.org/licenses/>
//
// Copyright 2013, David James Pearce.

package whilelang.compiler;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.locks.Condition;

import whilelang.ast.*;
import whilelang.ast.Stmt.Case;
import whilelang.ast.WhileFile.MacroDecl;
import whilelang.ast.WhileFile.MacroParameter;
import whilelang.ast.WhileFile.MethodDecl;
import whilelang.util.Pair;
import whilelang.util.SyntacticElement;

import static whilelang.util.SyntaxError.*;

/**
 * <p>
 * Responsible for expanding macros to their expression form
 * </p>
 *
 * @author David J. Pearce
 *
 */
public class MacroExpander {
	private WhileFile file;
	private HashMap<String,WhileFile.MethodDecl> methods;
	private HashMap<String,WhileFile.TypeDecl> types;
	private HashMap<String,WhileFile.MacroDecl> macros;

	public void check(WhileFile wf) {
		this.file = wf;
		this.methods = new HashMap<String,WhileFile.MethodDecl>();
		this.types = new HashMap<String,WhileFile.TypeDecl>();
		this.macros = new HashMap<String,WhileFile.MacroDecl>();

		for(WhileFile.Decl declaration : wf.declarations) {
			if(declaration instanceof WhileFile.MethodDecl) {
				WhileFile.MethodDecl fd = (WhileFile.MethodDecl) declaration;
				this.methods.put(fd.name(), fd);
			} else if(declaration instanceof WhileFile.TypeDecl) {
				WhileFile.TypeDecl fd = (WhileFile.TypeDecl) declaration;
				this.types.put(fd.name(), fd);
			} else if(declaration instanceof WhileFile.MacroDecl) {
				WhileFile.MacroDecl fd = (WhileFile.MacroDecl) declaration;
				this.macros.put(fd.name(), fd);
			}
		}

		for(WhileFile.Decl declaration : wf.declarations) {
			if(declaration instanceof WhileFile.MethodDecl) {
				check((WhileFile.MethodDecl) declaration);
			}
		}
	}

	private void check(MethodDecl decl) {
		check(decl.getBody());
	}

	public void check(List<Stmt> statements) {
		for(Stmt s : statements) {
			check(s);
		}
	}

	public void check(Stmt stmt) {
		if(stmt instanceof Stmt.Assert) {
			check((Stmt.Assert) stmt);
		} else if(stmt instanceof Stmt.Assign) {
			check((Stmt.Assign) stmt);
		} else if(stmt instanceof Stmt.Print) {
			check((Stmt.Print) stmt);
		} else if(stmt instanceof Stmt.Return) {
			check((Stmt.Return) stmt);
		} else if(stmt instanceof Stmt.Break) {
			// nothing to do
		} else if(stmt instanceof Stmt.Continue) {
			// nothing to do
		} else if(stmt instanceof Stmt.VariableDeclaration) {
			check((Stmt.VariableDeclaration) stmt);
		} else if(stmt instanceof Stmt.IfElse) {
			check((Stmt.IfElse) stmt);
		} else if(stmt instanceof Stmt.For) {
			check((Stmt.For) stmt);
		} else if(stmt instanceof Stmt.While) {
			check((Stmt.While) stmt);
		} else if(stmt instanceof Stmt.Do) {
			check((Stmt.Do) stmt);
		} else if(stmt instanceof Stmt.Switch) {
			check((Stmt.Switch) stmt);
		} else {
			internalFailure("unknown statement encountered (" + stmt + ")", file.filename,stmt);
		}
	}

	public void check(Stmt.VariableDeclaration stmt) {
		stmt.setExpr(expandMacros(stmt.getExpr()));
	}

	public void check(Stmt.Assert stmt) {
		stmt.setExpr(expandMacros(stmt.getExpr()));
	}

	public void check(Stmt.Assign stmt) {
		stmt.setRhs(expandMacros(stmt.getRhs()));
	}

	public void check(Stmt.Print stmt) {
		stmt.setExpr(expandMacros(stmt.getExpr()));
	}

	public void check(Stmt.Return stmt) {
		stmt.setExpr(expandMacros(stmt.getExpr()));
	}

	public void check(Stmt.IfElse stmt) {
		check(stmt.getFalseBranch());
		check(stmt.getTrueBranch());
		stmt.setCondition(expandMacros(stmt.getCondition()));
	}

	public void check(Stmt.For stmt) {
		stmt.setCondition(expandMacros(stmt.getCondition()));
		for (Stmt innerStmt : stmt.getBody()){
			check(innerStmt);
		}
	}

	public void check(Stmt.While stmt) {
		stmt.setCondition(expandMacros(stmt.getCondition()));
		for (Stmt innerStmt : stmt.getBody()){
			check(innerStmt);
		}
	}

	public void check(Stmt.Do stmt) {
		stmt.setCondition(expandMacros(stmt.getCondition()));
		for (Stmt innerStmt : stmt.getBody()){
			check(innerStmt);
		}
	}

	public void check(Stmt.Switch stmt) {
		stmt.setExpr(expandMacros(stmt.getExpr()));
		for (Case caseStmt : stmt.getCases()){
			check(caseStmt.getBody());
		}
	}

	private Expr expandMacros(Expr expr) {
		if (expr instanceof Expr.Invoke){
			Expr.Invoke invoke = (Expr.Invoke) expr;
			if (macros.containsKey(invoke.getName())){
				Expr macroExpr = macros.get(invoke.getName()).getExpr();

				List<MacroParameter> macroParams = macros.get(invoke.getName()).getParameters();
				Map<String, Expr> paramMap = new HashMap<String, Expr>();
				for (int i = 0; i < macroParams.size(); i++){
					paramMap.put(macroParams.get(i).getName(), invoke.getArguments().get(i));
				}

				Expr macro = replaceInvokeMacroArgs(macroExpr, paramMap);
				return expandMacros(macro);
			}
			else {
				List<Expr> args = new ArrayList<Expr>(invoke.getArguments().size());
				for (Expr e : invoke.getArguments()){
					args.add(expandMacros(e));
				}
				Attribute[] attrs = invoke.attributes().toArray(new Attribute[invoke.attributes().size()]);
				return new Expr.Invoke(invoke.getName(), args, attrs);
			}
		}
		else if (expr instanceof Expr.Binary){
			Expr.Binary binary = (Expr.Binary) expr;
			return new Expr.Binary(binary.getOp(),
					expandMacros(binary.getLhs()),
					expandMacros(binary.getRhs()),
					binary.attributes());
		}
		else if (expr instanceof Expr.ArrayInitialiser){
			Expr.ArrayInitialiser init = (Expr.ArrayInitialiser) expr;
			Attribute[] attrs = init.attributes().toArray(new Attribute[init.attributes().size()]);
			List<Expr> args = new ArrayList<Expr>(init.getArguments().size());
			for (Expr e : init.getArguments()){
				args.add(expandMacros(e));
			}
			return new Expr.ArrayInitialiser(args, attrs);
		}
		else if (expr instanceof Expr.Unary){
			Expr.Unary unary = (Expr.Unary) expr;
			Attribute[] attrs = unary.attributes().toArray(new Attribute[unary.attributes().size()]);
			return new Expr.Unary(unary.getOp(), expandMacros(unary.getExpr()), attrs);
		}
		else if (expr instanceof Expr.ArrayGenerator){
			Expr.ArrayGenerator gen = (Expr.ArrayGenerator) expr;

			Attribute[] attrs = attributesAsArray(gen);
			return new Expr.ArrayGenerator(
				expandMacros(gen.getValue()),
				expandMacros(gen.getSize()),
				attrs);
		}
		else if (expr instanceof Expr.RecordConstructor){
			Expr.RecordConstructor rCon = (Expr.RecordConstructor) expr;
			Attribute[] attrs = rCon.attributes().toArray(new Attribute[rCon.attributes().size()]);
			List<Pair<String, Expr>> pairs = new ArrayList<Pair<String, Expr>>();
			for (Pair<String, Expr> p : rCon.getFields()){
				pairs.add(new Pair<String, Expr>(p.first(), expandMacros(p.second())));
			}
			return new Expr.RecordConstructor(pairs, attrs);
		}
		else if (expr instanceof Expr.RecordAccess){
			Expr.RecordAccess rAcc = (Expr.RecordAccess) expr;
			Attribute[] attrs = rAcc.attributes().toArray(new Attribute[rAcc.attributes().size()]);
			return new Expr.RecordAccess(expandMacros(rAcc.getSource()), rAcc.getName(), attrs);
		}
		else if (expr instanceof Expr.IndexOf){
			Expr.IndexOf idx = (Expr.IndexOf) expr;
			return new Expr.IndexOf(expandMacros(idx.getSource()), idx.getIndex(), idx.attributes());
		}
		return expr;
	}

	private Expr replaceInvokeMacroArgs(Expr expr, Map<String, Expr> paramMap) {
		if (expr instanceof Expr.Invoke){
			Expr.Invoke invoke = (Expr.Invoke) expr;
			List<Expr> args = new ArrayList<Expr>(invoke.getArguments().size());
			for (Expr e : invoke.getArguments()){
				args.add(replaceInvokeMacroArgs(e, paramMap));
			}
			return new Expr.Invoke(invoke.getName(), args, attributesAsArray(invoke));
		}
		else if (expr instanceof Expr.Variable){
			Expr.Variable variable = (Expr.Variable) expr;
			if (paramMap.containsKey(variable.getName())) return paramMap.get(variable.getName());
			else return variable;
		}
		else if (expr instanceof Expr.Binary){
			Expr.Binary binary = (Expr.Binary) expr;
			return new Expr.Binary(binary.getOp(),
				replaceInvokeMacroArgs(binary.getLhs(), paramMap),
				replaceInvokeMacroArgs(binary.getRhs(), paramMap),
				binary.attributes());
		}
		else if (expr instanceof Expr.Unary){
			Expr.Unary unary = (Expr.Unary) expr;
			return new Expr.Unary(unary.getOp(), replaceInvokeMacroArgs(unary.getExpr(), paramMap));
		}
		else if (expr instanceof Expr.ArrayInitialiser){
			Expr.ArrayInitialiser init = (Expr.ArrayInitialiser) expr;
			List<Expr> args = new ArrayList<Expr>(init.getArguments().size());
			for (Expr e : init.getArguments()){
				args.add(replaceInvokeMacroArgs(e, paramMap));
			}
			return new Expr.ArrayInitialiser(args, attributesAsArray(init));
		}
		else if (expr instanceof Expr.ArrayGenerator){
			Expr.ArrayGenerator gen = (Expr.ArrayGenerator) expr;
			return new Expr.ArrayGenerator(
				replaceInvokeMacroArgs(gen.getValue(), paramMap),
				replaceInvokeMacroArgs(gen.getSize(), paramMap),
				attributesAsArray(gen));
		}
		else if (expr instanceof Expr.RecordConstructor){
			Expr.RecordConstructor rCon = (Expr.RecordConstructor) expr;
			Attribute[] attrs = rCon.attributes().toArray(new Attribute[rCon.attributes().size()]);
			List<Pair<String, Expr>> pairs = new ArrayList<Pair<String, Expr>>();
			for (Pair<String, Expr> p : rCon.getFields()){
				pairs.add(new Pair<String, Expr>(p.first(), replaceInvokeMacroArgs(p.second(), paramMap)));
			}
			return new Expr.RecordConstructor(pairs, attrs);
		}
		else if (expr instanceof Expr.RecordAccess){
			Expr.RecordAccess rAcc = (Expr.RecordAccess) expr;
			Attribute[] attrs = rAcc.attributes().toArray(new Attribute[rAcc.attributes().size()]);
			return new Expr.RecordAccess(replaceInvokeMacroArgs(rAcc.getSource(), paramMap), rAcc.getName(), attrs);
		}
		else if (expr instanceof Expr.IndexOf){
			Expr.IndexOf idx = (Expr.IndexOf) expr;
			return new Expr.IndexOf(replaceInvokeMacroArgs(idx.getSource(), paramMap), idx.getIndex(), idx.attributes());
		}

		return expr;
	}

	private Attribute[] attributesAsArray(Expr e) {
		return e.attributes().toArray(new Attribute[e.attributes().size()]);
	}

}
