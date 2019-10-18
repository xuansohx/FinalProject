import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.Socket;
import java.util.Scanner;

public class webserversSocketClient {
	static Socket socket;
	boolean rflag = true;
	public webserversSocketClient() {
	}
	public webserversSocketClient(String ip, int port) throws IOException {
		boolean flag = true;
		while (flag) {
			try {
				// Construct������ socket�� ����
				// connection�� �Ͼ socket�� ���������?
				socket = new Socket(ip, port);
				if (socket != null && socket.isConnected()) {
					break; // socket�� �� ���� ����� ��
				}
			} catch (Exception e) {
				System.out.println("Re-Try");
				// socket�� �� ��������� retry �ؾ� ��
				try {
					Thread.sleep(3000);
				} catch (InterruptedException e1) {
					e1.printStackTrace();
				}
			}
		} // end while
		new Receiver(socket).start();
	}

	public void sendMsg(String msg) throws IOException {
		Sender sender = null;
		sender = new Sender(socket);
		sender.setMsg(msg);
		sender.start();
	}

	public void start() throws Exception {
		// Client �����϶�� �ǹ��� start
		/*
		 * try { // ������ thread? out = socket.getOutputStream(); dout= new
		 * DataOutputStream(out); in = socket.getInputStream(); din = new
		 * DataInputStream(in); dout.writeUTF("HELLO.."); // Client�� ������ �޽���
		 * 
		 * // �޴� thread? String str = din.readUTF(); System.out.println(str);
		 * }catch(Exception e) { throw e; }finally { if(din != null) { din.close(); }
		 * if(socket != null) { socket.close(); } }
		 */

		// ������ ���� ���⿡�� - �޽���
		Scanner sc = new Scanner(System.in);
		boolean sflag = true;
		while (sflag) {
			System.out.println(socket);
			System.out.println("Input Msg.");
			String str = sc.next();
			sendMsg(str); // message�� ���� - sendMsg �Լ��� send��� Thread?
			// Start�� �Ǹ� socket�� �����ǰ�, Thread�� ���� �ְ� ����
			if (str.equals("q")) { // 'q' �Է��ϸ� ����
				break;
			}
		}
		System.out.println("Bye...");
		sc.close();
	}

	// Inner Class�� ����
	class Sender extends Thread {

		OutputStream out;
		DataOutputStream dout;
		String msg;

		public Sender(Socket socket) throws IOException {
			out = socket.getOutputStream();
			dout = new DataOutputStream(out);
		}

		public void setMsg(String msg) {
			this.msg = msg;
		}

		public void run() {
			if (dout != null) {
				try {
					dout.writeUTF(msg);
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}

	class Receiver extends Thread {
		// connection�� �Ǹ� client�� ������ �־ server�� �޽��� ���� �� �ֵ���
		Socket socket;
		InputStream in;
		DataInputStream din;

		public Receiver(Socket socket) throws IOException {
			this.socket = socket;
			in = socket.getInputStream();
			din = new DataInputStream(in);
		}

		public void run() {
			// �޴� ���Ҹ� ����
			try {
				while (rflag) {
					String str = din.readUTF();
					System.out.println(str);
				}
			} catch (Exception e) {
			}
		}
	}

	public static void main(String[] args) {
		
		try {

			Runnable r = new Runnable() {
				@Override
				public void run() {
					webserversSocketClient client = null;
					try {
						client = new webserversSocketClient("70.12.225.81", 1234);
					client.start();
					client.sendMsg("hiroo");
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
			};
			Thread t= new Thread(r);
			t.start();
			System.out.println(socket);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
