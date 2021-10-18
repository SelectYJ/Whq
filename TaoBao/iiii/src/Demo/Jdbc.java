package Demo;

import java.sql.*;

public class Jdbc {
    private String url;
    private String suser;
    private String spassword;
    private Connection conn;
    private PreparedStatement prepar;
    private String[][] strsStrings;
    private int str = 0, columnCount = 0;

    //���췽��
    public Jdbc() {
        //Э��:��Э��:����Դ��ʶ
        url = "jdbc:mysql://localhost:3306/taobao?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC&useSSL=false";
        suser = "root";
        spassword = "root";
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getSuser() {
        return suser;
    }

    public void setSuser(String suser) {
        this.suser = suser;
    }

    public String getSpassword() {
        return spassword;
    }

    public void setSpassword(String spassword) {
        this.spassword = spassword;
    }

    public Connection getConn() {
        return conn;
    }

    public void setConn(Connection conn) {
        this.conn = conn;
    }

    public PreparedStatement getPrepar() {
        return prepar;
    }

    public void setPrepar(PreparedStatement prepar) {
        this.prepar = prepar;
    }

    public String[][] getStrsStrings() {
        return strsStrings;
    }

    public void setStrsStrings(String[][] strsStrings) {
        this.strsStrings = strsStrings;
    }

    public int getStr() {
        return str;
    }

    public void setStr(int str) {
        this.str = str;
    }

    public int getColumnCount() {
        return columnCount;
    }

    public void setColumnCount(int columnCount) {
        this.columnCount = columnCount;
    }


    //��װ����
    public void Connect() throws ClassNotFoundException, SQLException {
        //1.����������
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(url, suser, spassword);
    }

    //��sql���������ݿ�
    public void visit(String sql) throws SQLException {
        prepar = conn.prepareStatement(sql);
    }

    //��װ�ر�����
    public void closeConnect() throws SQLException {
        if (conn != null && !conn.isClosed()) {
            conn.close();
        }
    }

    //��װ��Ʒ���ܵ����ݿ�ķ���
    public String[][] Introduction() throws ClassNotFoundException, SQLException {
        Connect();
        String sql = "select * from ";
        visit(sql);
        Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
        ResultSet rs = stmt.executeQuery(sql);

        System.out.println(rs.next());
        while (rs.next()) {
            str = rs.getRow();
            ResultSetMetaData rsmd = rs.getMetaData(); //��ȡ���ݿ��ж�����
            columnCount = rsmd.getColumnCount();//��ȡ���ݿ��ж�����
        }
        strsStrings = new String[str][columnCount];
        int i = 0;
        rs.beforeFirst();
        while (rs.next()) {
            strsStrings[i][0] = rs.getString(1);
            strsStrings[i][1] = rs.getString(2);
            strsStrings[i][2] = rs.getString(3);
            strsStrings[i][3] = rs.getString(4);
            strsStrings[i][4] = rs.getString(5);
            strsStrings[i][5] = rs.getString(6);
            strsStrings[i][6] = rs.getString(7);
            strsStrings[i][7] = rs.getString(8);
            i++;
        }
        closeConnect();
        return strsStrings;
    }

    //��װ��¼�ĺ�̨����
    public boolean signInCheck(String user, String pass) throws ClassNotFoundException, SQLException {
        String str1 = null, p = null;
        Connect();
        //��ѯ���ݱ��е����ݲ������ж���û������˺�
        String sql1 = "select * from taobaozh where name=?";
        PreparedStatement prepar = conn.prepareStatement(sql1);
        prepar.setString(1, user);
        ResultSet rs1 = prepar.executeQuery();
        while (rs1.next()) {
            str1 = rs1.getString(1);
            p = rs1.getString(2);
        }
        if (str1 == null) {
//			System.out.print("�û���"+user+"������!��������д!��ע����ٵ�¼");
            closeConnect();
            return false;
        } else {
            if (!p.equals(pass)) {
//				System.out.print("�������");
                closeConnect();
                return false;
            } else {
//				System.out.print("��¼�У���ȴ�......");
                Statement stmt1 = conn.createStatement();
                String sql = "update taobaozh set flag=1 where name='" + user + "'";
                stmt1.executeUpdate(sql);
                str1 = null;
                closeConnect();
                return true;
            }
        }
    }

    //��װע��ĺ�̨����
    public boolean ZsignInCheck(String name, String pass) throws ClassNotFoundException, SQLException {
        String str2 = null;
        Connect();
        String sql1 = "select * from taobaozh where name=?";
        PreparedStatement prepar = conn.prepareStatement(sql1);
        prepar.setString(1, name);
        ResultSet rs1 = prepar.executeQuery();
        while (rs1.next()) {
            str2 = rs1.getString(1);
        }
        if (str2 == null) {
            String sql = "insert into taobaozh() values(?,?,?)";
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, name);
            pre.setString(2, pass);
            pre.setString(3, "0");
            int n = pre.executeUpdate();//ִ�и������ݿ����
            //4.ִ�в�ѯ
            if (n == 1) {
//				System.out.println("ע��ɹ���");
                return true;
            }
        } else {
//			System.out.println("�û����Ѵ���!");
            str2 = null;
            return false;
        }
        closeConnect();
        return false;
    }

    //��װUser,�û���Ϣ���²���
    public int Updata(String xuser, String pass) throws ClassNotFoundException, SQLException {
        String s = null;
        int rs1 = 2;
        s = Quuser();
        if (s.equals(xuser)) {
            Connect();
            Statement stmt = conn.createStatement();
            String sql1 = "update taobaozh set name='" + xuser + "',password='" + pass + "' where name='" + s + "'";
            rs1 = stmt.executeUpdate(sql1);
        }
        return rs1;
    }

    //��¼ҳ�����ʱˢ�����ݿ�
    public void UpQuuter() throws ClassNotFoundException, SQLException {
        Connect();
        Statement stmt = conn.createStatement();
        String sql = "update taobaozh set flag=0 where flag=1";
        stmt.executeUpdate(sql);
    }

    //���ڷ����û���
    public String Quuser() throws ClassNotFoundException, SQLException {
        String s = null;
        Connect();
        Statement stmt = conn.createStatement();
        String sql = "select name from taobaozh where flag=1";
        ResultSet rs = stmt.executeQuery(sql);
        while (rs.next()) {
            s = rs.getString(1);
        }
        return s;
    }

    //���ڷ�������
    public String Qupass() throws ClassNotFoundException, SQLException {
        String s = null;
        Connect();
        Statement stmt = conn.createStatement();
        String sql = "select password from taobaozh where flag=1";
        ResultSet rs = stmt.executeQuery(sql);
        while (rs.next()) {
            s = rs.getString(1);
        }
        return s;
    }

    public boolean Deleuser() throws ClassNotFoundException, SQLException {
        boolean so = true;
        Connect();
        Statement stmt = conn.createStatement();
        String sql = "delete from  taobaozh where name='" + Quuser() + "'";
        int rs = stmt.executeUpdate(sql);
        if (rs == 1) {
            so = true;
        } else {
            so = false;
        }
        return so;
    }
}
