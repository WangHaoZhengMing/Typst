public class DivideNumbers {
   public static void main(String[] args) {
       if (args.length < 2) {
           System.out.println("请提供两个数字作为参数");
           return;
       }

       try {
           double numerator = Double.parseDouble(args[0]);
           double denominator = Double.parseDouble(args[1]);

           if (denominator == 0) {
               throw new ArithmeticException("除数不能为0");
           }

           double result = numerator / denominator;
           System.out.println(args[0] + " / " + args[1] + " = " + result);
       } catch (NumberFormatException e) {
           System.out.println("输入的参数不是有效的数字: " + e.getMessage());
       } catch (ArithmeticException e) {
           System.out.println("算术错误: " + e.getMessage());
       }
   }
}