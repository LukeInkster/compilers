package whilelang.testing;

import static org.junit.Assert.fail;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Collection;

import org.junit.*;
import org.junit.runner.RunWith;
import org.junit.runners.Parameterized;
import org.junit.runners.Parameterized.Parameters;

import jx86.io.AsmFileWriter;
import jx86.lang.Target;
import jx86.lang.X86File;
import whilelang.ast.WhileFile;
import whilelang.compiler.WhileCompiler;
import whilelang.compiler.X86FileWriter;


@RunWith(Parameterized.class)
public class WIPTests {
	 // you'll need to change this for your platform.
        public final static Target TARGET = Target.LINUX_X86_64; //Target.MACOS_X86_64;

	private final static String RUNTIME_LIBRARY = "src/whilelang/runtime/runtime.c".replace('/',
			File.separatorChar);

	private static final String WHILE_SRC_DIR = "tests/valid/".replace('/', File.separatorChar);

	private static final String[] INCLUDED = {
		"ArrayInitialiser_Valid_1",
		"ArrayInitialiser_Valid_3",
		"ArrayInitialiser_Valid_4",
		"ArrayGenerator_Valid_1",
		"ArrayGenerator_Valid_2",
		"ArrayGenerator_Valid_3",
		"ArrayGenerator_Valid_4",
		"ArrayGenerator_Valid_5",
		"ArrayEquals_Valid_1",
		"ArrayEquals_Valid_2",
		"ArrayEquals_Valid_3",
		"ArrayEquals_Valid_4",
		"ArrayAccess_Valid_1",
		"ArrayAccess_Valid_2",
		"ArrayAssign_Valid_1",
		"ArrayAssign_Valid_2",
		"ArrayAssign_Valid_5",
		"ArrayAssign_Valid_6",
	};

	private final String testName;

	public WIPTests(String testName) {
		this.testName = testName;
	}

	private static boolean includedTest(String name) {
		for(int i=0;i!=INCLUDED.length;++i) {
			if(INCLUDED[i].equals(name)) {
				return true;
			}
		}
		return false;
	}

	// Here we enumerate all available test cases.
	@Parameters(name = "{0}")
	public static Collection<Object[]> data() {
		ArrayList<Object[]> testcases = new ArrayList<Object[]>();
		for (File f : new File(WHILE_SRC_DIR).listFiles()) {
			if (f.isFile()) {
				String name = f.getName();
				if (name.endsWith(".while")) {
					// Get rid of ".while" extension
					String testName = name.substring(0, name.length() - 6);
					if(includedTest(testName)) {
						testcases.add(new Object[] { testName });
					}
				}
			}
		}
		return testcases;
	}

	@Test
	public void valid() throws IOException {
		compileTest(this.testName);
		executeTest(WHILE_SRC_DIR,this.testName);
	}

	protected void compileTest(String testname) throws IOException {
		String sourceFileName = WHILE_SRC_DIR + testname + ".while";
		String asmFileName = WHILE_SRC_DIR + testname + ".s";
		WhileCompiler compiler = new WhileCompiler(sourceFileName);
		WhileFile ast = compiler.compile();
		X86File file = new X86FileWriter(TARGET).build(ast);
		new AsmFileWriter(new File(asmFileName)).write(file);
		// Second, we need to compile the assembly file with gcc
		compileWithGcc(WHILE_SRC_DIR, testname, asmFileName, RUNTIME_LIBRARY);
	}

	public void compileWithGcc(String dir, String target, String... files) {
		try {
			String tmp = "gcc -Wno-format -o " + dir + target;
			for (String f : files) {
				tmp += " " + f;
			}
			Process p = Runtime.getRuntime().exec(tmp);
			StringBuffer syserr = new StringBuffer();
			StringBuffer sysout = new StringBuffer();
			new StreamGrabber(p.getErrorStream(), syserr);
			new StreamGrabber(p.getInputStream(), sysout);
			int exitCode = p.waitFor();
			System.err.println(syserr); // propagate anything from the error
			// stream
			if (exitCode != 0) {
				System.err
				.println("============================================================");
				System.err.println(tmp);
				System.err
				.println("============================================================");
				fail("Problem running gcc to compile test");
			}
		} catch (Exception ex) {
			ex.printStackTrace();
			fail("Problem running gcc to compile test");
		}
	}

	public String executeTest(String dir, String executable) {
		try {
			Process p = Runtime.getRuntime().exec(dir + executable);
			StringBuffer syserr = new StringBuffer();
			StringBuffer sysout = new StringBuffer();
			new StreamGrabber(p.getErrorStream(), syserr);
			new StreamGrabber(p.getInputStream(), sysout);
			int exitCode = p.waitFor();
			System.err
					.println("============================================================");
			System.err.println(dir + executable);
			System.err
					.println("============================================================");
			System.err.println(syserr); // propagate anything from the error
			if(exitCode != 0) {
				fail("Assertion failure running native executable");
			}
			// stream
			return sysout.toString();
		} catch (Exception ex) {
			ex.printStackTrace();
			fail("Problem running native executable");
			return null;
		}
	}

	/**
	 * Grab everything produced by a given input stream until the End-Of-File
	 * (EOF) is reached. This is implemented as a separate thread to ensure that
	 * reading from other streams can happen concurrently. For example, we can
	 * read concurrently from <code>stdin</code> and <code>stderr</code> for
	 * some process without blocking that process.
	 *
	 * @author David J. Pearce
	 *
	 */
	static public class StreamGrabber extends Thread {
		private InputStream input;
		private StringBuffer buffer;

		StreamGrabber(InputStream input, StringBuffer buffer) {
			this.input = input;
			this.buffer = buffer;
			start();
		}

		public void run() {
			try {
				int nextChar;
				// keep reading!!
				while ((nextChar = input.read()) != -1) {
					buffer.append((char) nextChar);
				}
			} catch (IOException ioe) {
			}
		}
	}
}
