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

    //构造方法
    public Jdbc() {
        //协议:子协议:数据源标识
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


    //封装连接
    public void Connect() throws ClassNotFoundException, SQLException {
        //1.加载驱动器
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(url, suser, spassword);
    }

    //用sql语句访问数据库
    public void visit(String sql) throws SQLException {
        prepar = conn.prepareStatement(sql);
    }

    //封装关闭连接
    public void closeConnect() throws SQLException {
        if (conn != null && !conn.isClosed()) {
            conn.close();
        }
    }

    //封装商品介绍的数据库的访问
    public String[][] Introduction() throws ClassNotFoundException, SQLException {
        Connect();
        String sql = "select * from ";
        visit(sql);
        Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
        ResultSet rs = stmt.executeQuery(sql);

        System.out.println(rs.next());
        while (rs.next()) {
            str = rs.getRow();
            ResultSetMetaData rsmd = rs.getMetaData(); //获取数据库有多少行
            columnCount = rsmd.getColumnCount();//获取数据库有多少列
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

    //封装登录的后台操作
    public boolean signInCheck(String user, String pass) throws ClassNotFoundException, SQLException {
        String str1 = null, p = null;
        Connect();
        //查询数据表中的数据并进行判断有没有这个账号
        String sql1 = "select * from taobaozh where name=?";
        PreparedStatement prepar = conn.prepareStatement(sql1);
        prepar.setString(1, user);
        ResultSet rs1 = prepar.executeQuery();
        while (rs1.next()) {
            str1 = rs1.getString(1);
            p = rs1.getString(2);
        }
        if (str1 == null) {
//			System.out.print("用户名"+user+"不存在!请重新填写!或注册后再登录");
            closeConnect();
            return false;
        } else {
            if (!p.equals(pass)) {
//				System.out.print("密码错误！");
                closeConnect();
                return false;
            } else {
//				System.out.print("登录中，请等待......");
                Statement stmt1 = conn.createStatement();
                String sql = "update taobaozh set flag=1 where name='" + user + "'";
                stmt1.executeUpdate(sql);
                str1 = null;
                closeConnect();
                return true;
            }
        }
    }

    //封装注册的后台操作
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
            int n = pre.executeUpdate();//执行更新数据库语句
            //4.执行查询
            if (n == 1) {
//				System.out.println("注册成功！");
                return true;
            }
        } else {
//			System.out.println("用户名已存在!");
            str2 = null;
            return false;
        }
        closeConnect();
        return false;
    }

    //封装User,用户信息更新操作
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

    //登录页面加载时刷新数据库
    public void UpQuuter() throws ClassNotFoundException, SQLException {
        Connect();
        Statement stmt = conn.createStatement();
        String sql = "update taobaozh set flag=0 where flag=1";
        stmt.executeUpdate(sql);
    }

    //用于返回用户名
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

    //用于返回密码
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
