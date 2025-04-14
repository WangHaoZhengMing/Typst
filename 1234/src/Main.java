
import java.util.*;

class Main {

    static int n;
    static List<String> ans = new ArrayList<>();
    static String ff;

    public static void dfs() {
        if (ff.length() == n - 1 && getSum() == 0) {
            ans.add(String.copyValueOf(ff.toCharArray()));
            return;
        }
        if (ff.length() == n - 1) {
            return;
        }
        String temp = new String(ff);
        ff = ff + " ";
        dfs();
        ff = temp;
        ff = ff + "+";
        dfs();
        ff = temp;
        ff = ff + "-";
        dfs();
        ff = temp;

        return;
    }

    public static int getSum() {
        int sum = 1;
        int lastVal = 1;
        for (int i = 0; i < n - 1; i++) {
            char c = ff.charAt(i);
            if (c == '+') {
                sum += i + 2;
                lastVal = i + 2;
            } else if (c == '-') {
                sum -= i + 2;
                lastVal = -(i + 2);
            } else if (c == ' ') {
                sum -= lastVal;
                String s = String.valueOf(lastVal);
                s = s + String.valueOf(i + 2);
                sum += Integer.valueOf(s);
                lastVal = Integer.valueOf(s);
            }
        }
        return sum;
    }
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        n = sc.nextInt();
        ff = "";
        dfs();
        for (String s : ans) {
            for (int i = 0; i < s.length(); i++) {
                System.out.print((i + 1) + String.valueOf(s.charAt(i)));
            }
            System.out.println(n);
        }
    }
}
