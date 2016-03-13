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

import whilelang.ast.*;
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
	private WhileFile.MethodDecl method;
	private HashMap<String,WhileFile.MethodDecl> methods;
	private HashMap<String,WhileFile.TypeDecl> types;

	public void check(WhileFile wf) {
		this.file = wf;

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
		} else if(stmt instanceof Expr.Invoke) {
			check((Expr.Invoke) stmt);
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

	}

	public void check(Stmt.Assert stmt) {
	}

	public void check(Stmt.Assign stmt) {
	}

	public void check(Stmt.Print stmt) {
	}

	public void check(Stmt.Return stmt) {
	}

	public void check(Stmt.IfElse stmt) {
	}

	public void check(Stmt.For stmt) {
	}

	public void check(Stmt.While stmt) {
	}

	public void check(Stmt.Do stmt) {
	}

	public void check(Stmt.Switch stmt) {
	}
}
