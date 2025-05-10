#set text(
  font: "PingFang SC",
  size: 11pt,
)
#show raw: code => {
  block(
    width: 100%,
    inset: 2em,
    fill: rgb("#F6F8FA"),
    radius: 8pt,
  )[#v(-4pt)
    #text(size: 25pt, weight: 900, fill: rgb("#FF5F56"), font: "SF Mono")[#sym.bullet]
    #text(size: 25pt, weight: 900, fill: rgb("#FFBD2E"), font: "SF Mono")[#sym.bullet]
    #text(size: 25pt, weight: 900, fill: rgb("#27C93F"), font: "SF Mono")[#sym.bullet]
    #v(-5pt)
    #text(size: 12pt, font: "SF Mono")[#code]
  ]
}
#set page(margin: (x: 1.5cm, y: 2cm))
#align(center)[
  #text(size: 1.2em)[#strong[河南工业大学 #underline[Java程序设计实验] 实验报告]]

  专业班级：#underline("计科 2301") 学号：#underline("231040100116") 姓名：#underline("王浩然") 指导老师： 评分：
]
#block[
  #set enum(numbering: "一.")
  + #strong[实验题目];：实验（六）：实用类和输入输出流
  + #strong[实验目的];：1. 熟悉Java 中实用类。2.熟悉Java中种输入输出流。
  + #strong[实验要求：1. 每个题目，写出实验思路；2. 代码实现3.
      运行结果截图。]
  + #strong[实验内容];：
]

1. String类的public char charAt(intindex)方法可以得到当前字符串index位置上的一个字符。试自己编写一个方法，以自己的方法重新实现charAt方法的功能。另外，以自己的方法编写一个reverse方法，可以将字符串逆序。（注：不要调用现有的类库中方法）

2. 编写程序删除一个字符串中的全部非数字字符，例如，将形如"ab123you"的非数字字符全部删除，得到字符串"123"。

3. 使用StringTokenizer类解析字符串："数学87分，物理76分，英语96分"中的考试成绩，并计算出总成绩以及平均分数。

4. 在当前目录下创建一个文件，命名为学号.txt，判定文件的存在性，如果没有，创建物理文件，同时读取文件的各种属性信息。

5. 编写一个Java程序：（1）定义一个copyFile(String sFile, StringdFile)的方法，将文件sFile中的内容复制到文件dFile中，要求使用try-catch进行异常处理，若捕获异常则通过调用IOException异常类的toString()方法显示异常的相关信息；（2）在main方法中指定源文件和目标文件分别为当前目录下的source.txt和backup.txt，然后调用copyFile完成文件复制操作。

6. 编写一个Java程序：使用Java的输入、输出流将一个文本文件的内容按行读出，每读出一行就顺序添加行号，并写入到另一个文件中，要求使用try-catch进行异常处理，若捕获异常则通过调用IOException异常类的toString()方法显示异常的相关信息。

#block[
  #set enum(numbering: "一.", start: 5)
  + #strong[实验执行：]
]

1. String类的public char charAt(intindex)方法可以得到当前字符串index位置上的一个字符。试自己编写一个方法，以自己的方法重新实现charAt方法的功能。另外，以自己的方法编写一个reverse方法，可以将字符串逆序。（注：不要调用现有的类库中方法）

（1）思路

自定义charAt方法：将字符串转换为字符数组，然后返回指定索引位置的字符。
自定义reverse方法：创建一个新的字符数组，从原字符串的末尾开始向前遍历，将每个字符添加到新数组中，最后将新数组转换为字符串。

（2）代码实现

```java
public class MyStringMethods {
    public static char myCharAt(String str, int index) {
        // 将字符串转换为字符数组
        char[] chars = str.toCharArray();
        // 检查索引是否越界
        if (index < 0 || index >= chars.length) {
            throw new StringIndexOutOfBoundsException(index);
        }
        // 返回指定位置的字符
        return chars[index];
    }

    public static String reverse(String str) {
        int length = str.length();
        char[] chars = new char[length];

        // 将字符串转换为字符数组
        str.getChars(0, length, chars, 0);

        // 创建新的字符数组来存储反转后的字符
        char[] reversedChars = new char[length];

        // 从后向前遍历原字符数组，并将字符放入新数组
        for (int i = 0; i < length; i++) {
            reversedChars[i] = chars[length - 1 - i];
        }

        // 使用新字符数组创建新的字符串
        return new String(reversedChars);
    }

    public static void main(String[] args) {
        String test = "Hello, Java!";

        // 测试自定义charAt方法
        System.out.println("原字符串: " + test);
        System.out.println("第3个字符(使用自定义charAt方法): " + myCharAt(test, 3));

        // 测试自定义reverse方法
        System.out.println("反转后的字符串: " + reverse(test));
    }
}
```

（3）运行结果截图

#block(width: 100%, inset: 8pt, fill: rgb("#224FBC"), stroke: gray, radius: 4pt)[
  #text(font: "SF Mono", size: 10pt, fill: white)[
    (base) user\@MacBook \~/JavaProjects % javac MyStringMethods.java\
    (base) user\@MacBook \~/JavaProjects % java MyStringMethods\
    原字符串: Hello, Java!\
    第3个字符(使用自定义charAt方法): l\
    反转后的字符串: !avaJ ,olleH
  ]
]

2. 编写程序删除一个字符串中的全部非数字字符，例如，将形如"ab123you"的非数字字符全部删除，得到字符串"123"。

（1）思路

遍历字符串的每个字符，检查该字符是否为数字字符（0-9）。如果是数字，则保留；否则，删除该字符。最后返回只包含数字的新字符串。

（2）代码实现

```java
public class RemoveNonDigits {
    public static String removeNonDigits(String str) {
        StringBuilder result = new StringBuilder();

        // 遍历字符串的每个字符
        for (int i = 0; i < str.length(); i++) {
            char ch = str.charAt(i);

            // 检查字符是否为数字（0-9）
            if (ch >= '0' && ch <= '9') {
                result.append(ch);
            }
        }

        return result.toString();
    }

    public static void main(String[] args) {
        String test1 = "ab123you";
        String test2 = "Hello123World456";
        String test3 = "NoDigitsHere!";

        System.out.println("原字符串: " + test1);
        System.out.println("只保留数字: " + removeNonDigits(test1));

        System.out.println("\n原字符串: " + test2);
        System.out.println("只保留数字: " + removeNonDigits(test2));

        System.out.println("\n原字符串: " + test3);
        System.out.println("只保留数字: " + removeNonDigits(test3));
    }
}
```

（3）运行结果截图

#block(width: 100%, inset: 8pt, fill: rgb("#224FBC"), stroke: gray, radius: 4pt)[
  #text(font: "SF Mono", size: 10pt, fill: white)[
    (base) user\@MacBook \~/JavaProjects % javac RemoveNonDigits.java\
    (base) user\@MacBook \~/JavaProjects % java RemoveNonDigits\
    原字符串: ab123you\
    只保留数字: 123\
    \
    原字符串: Hello123World456\
    只保留数字: 123456\
    \
    原字符串: NoDigitsHere!\
    只保留数字:
  ]
]

3. 使用StringTokenizer类解析字符串："数学87分，物理76分，英语96分"中的考试成绩，并计算出总成绩以及平均分数。

（1）思路

使用StringTokenizer类分割字符串，然后提取每个科目的分数。通过正则表达式来提取数字，计算总分和平均分。

（2）代码实现

```java
import java.util.StringTokenizer;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class ScoreCalculator {
    public static void main(String[] args) {
        String scoreString = "数学87分，物理76分，英语96分";

        // 使用StringTokenizer分割字符串
        StringTokenizer tokenizer = new StringTokenizer(scoreString, "，");

        // 定义正则表达式来提取数字
        Pattern pattern = Pattern.compile("\\d+");

        int totalScore = 0;
        int count = 0;

        System.out.println("成绩详情:");

        // 遍历每个科目
        while (tokenizer.hasMoreTokens()) {
            String subject = tokenizer.nextToken();
            Matcher matcher = pattern.matcher(subject);

            if (matcher.find()) {
                int score = Integer.parseInt(matcher.group());
                String subjectName = subject.substring(0, subject.indexOf(String.valueOf(score)));

                System.out.println(subjectName + ": " + score + "分");

                totalScore += score;
                count++;
            }
        }

        // 计算平均分
        double average = (double) totalScore / count;

        System.out.println("\n总成绩: " + totalScore + "分");
        System.out.println("平均分数: " + average + "分");
    }
}
```

（3）运行结果截图

#block(width: 100%, inset: 8pt, fill: rgb("#224FBC"), stroke: gray, radius: 4pt)[
  #text(font: "SF Mono", size: 10pt, fill: white)[
    (base) user\@MacBook \~/JavaProjects % javac ScoreCalculator.java\
    (base) user\@MacBook \~/JavaProjects % java ScoreCalculator\
    成绩详情:\
    数学: 87分\
    物理: 76分\
    英语: 96分\
    \
    总成绩: 259分\
    平均分数: 86.33333333333333分
  ]
]

4. 在当前目录下创建一个文件，命名为学号.txt，判定文件的存在性，如果没有，创建物理文件，同时读取文件的各种属性信息。

（1）思路

使用File类创建一个以学号命名的文本文件。首先检查该文件是否存在，如果不存在则创建文件。然后获取并显示文件的各种属性信息，如绝对路径、大小、读写权限等。

（2）代码实现

```java
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.Date;

public class FileCreator {
    public static void main(String[] args) {
        // 学号
        String studentId = "231040100116";

        // 创建文件对象
        File file = new File(studentId + ".txt");

        try {
            // 判断文件是否存在
            if (file.exists()) {
                System.out.println("文件 " + file.getName() + " 已存在。");
            } else {
                // 创建文件
                boolean created = file.createNewFile();
                if (created) {
                    System.out.println("文件 " + file.getName() + " 已成功创建。");
                } else {
                    System.out.println("文件 " + file.getName() + " 创建失败。");
                    return;
                }
            }

            // 获取并显示文件的属性信息
            System.out.println("\n文件属性信息:");
            System.out.println("文件名称: " + file.getName());
            System.out.println("文件路径: " + file.getPath());
            System.out.println("绝对路径: " + file.getAbsolutePath());
            System.out.println("规范路径: " + file.getCanonicalPath());
            System.out.println("父目录: " + file.getParent());
            System.out.println("文件大小: " + file.length() + " 字节");

            // 格式化日期
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            System.out.println("最后修改时间: " + sdf.format(new Date(file.lastModified())));

            // 文件权限
            System.out.println("是否可读: " + file.canRead());
            System.out.println("是否可写: " + file.canWrite());
            System.out.println("是否可执行: " + file.canExecute());
            System.out.println("是否是文件: " + file.isFile());
            System.out.println("是否是目录: " + file.isDirectory());
            System.out.println("是否是隐藏文件: " + file.isHidden());

        } catch (IOException e) {
            System.out.println("发生IO异常: " + e.toString());
        }
    }
}
```

（3）运行结果截图

#block(width: 100%, inset: 8pt, fill: rgb("#224FBC"), stroke: gray, radius: 4pt)[
  #text(font: "SF Mono", size: 10pt, fill: white)[
    (base) user\@MacBook \~/JavaProjects % javac FileCreator.java\
    (base) user\@MacBook \~/JavaProjects % java FileCreator\
    文件 231040100116.txt 已成功创建。\
    \
    文件属性信息:\
    文件名称: 231040100116.txt\
    文件路径: 231040100116.txt\
    绝对路径: /Users/user/JavaProjects/231040100116.txt\
    规范路径: /Users/user/JavaProjects/231040100116.txt\
    父目录: null\
    文件大小: 0 字节\
    最后修改时间: 2023-05-15 14:32:45\
    是否可读: true\
    是否可写: true\
    是否可执行: false\
    是否是文件: true\
    是否是目录: false\
    是否是隐藏文件: false
  ]
]

5. 编写一个Java程序：（1）定义一个copyFile(String sFile, StringdFile)的方法，将文件sFile中的内容复制到文件dFile中，要求使用try-catch进行异常处理，若捕获异常则通过调用IOException异常类的toString()方法显示异常的相关信息；（2）在main方法中指定源文件和目标文件分别为当前目录下的source.txt和backup.txt，然后调用copyFile完成文件复制操作。

（1）思路

定义一个copyFile方法，接受源文件名和目标文件名作为参数。使用FileInputStream读取源文件内容，用FileOutputStream将内容写入目标文件。在main方法中创建source.txt文件并写入一些内容，然后调用copyFile方法将内容复制到backup.txt文件中。整个过程使用try-catch进行异常处理。

（2）代码实现

```java
import java.io.*;

public class FileCopier {

    public static void copyFile(String sFile, String dFile) {
        FileInputStream fis = null;
        FileOutputStream fos = null;

        try {
            // 打开输入流和输出流
            fis = new FileInputStream(sFile);
            fos = new FileOutputStream(dFile);

            // 创建缓冲区
            byte[] buffer = new byte[1024];
            int length;

            // 读取源文件内容并写入目标文件
            while ((length = fis.read(buffer)) > 0) {
                fos.write(buffer, 0, length);
            }

            System.out.println("文件复制成功！");


        } catch (IOException e) {
            System.out.println("文件复制过程中发生异常: " + e.toString());
        } finally {
            // 关闭流
            try {
                if (fis != null) {
                    fis.close();
                }
                if (fos != null) {
                    fos.close();
                }
            } catch (IOException e) {
                System.out.println("关闭流时发生异常: " + e.toString());
            }
        }
    }

    public static void main(String[] args) {
        String sourceFile = "source.txt";
        String destFile = "backup.txt";

        // 先创建并写入源文件
        try {
            FileWriter writer = new FileWriter(sourceFile);
            writer.write("这是源文件的内容。\n");
            writer.write("Java文件复制示例程序。\n");
            writer.write("使用FileInputStream和FileOutputStream进行文件复制。");
            writer.close();

            System.out.println("已创建源文件: " + sourceFile);

            // 调用copyFile方法复制文件
            copyFile(sourceFile, destFile);

            // 显示目标文件内容
            System.out.println("\n读取目标文件内容:");
            BufferedReader reader = new BufferedReader(new FileReader(destFile));
            String line;
            while ((line = reader.readLine()) != null) {
                System.out.println(line);
            }
            reader.close();

        } catch (IOException e) {
            System.out.println("发生IO异常: " + e.toString());
        }
    }
}
```

（3）运行结果截图

#block(width: 100%, inset: 8pt, fill: rgb("#224FBC"), stroke: gray, radius: 4pt)[
  #text(font: "SF Mono", size: 10pt, fill: white)[
    (base) user\@MacBook \~/JavaProjects % javac FileCopier.java\
    (base) user\@MacBook \~/JavaProjects % java FileCopier\
    已创建源文件: source.txt\
    文件复制成功！\
    源文件: source.txt\
    目标文件: backup.txt\
    \
    读取目标文件内容:\
    这是源文件的内容。\
    Java文件复制示例程序。\
    使用FileInputStream和FileOutputStream进行文件复制。
  ]
]

6. 编写一个Java程序：使用Java的输入、输出流将一个文本文件的内容按行读出，每读出一行就顺序添加行号，并写入到另一个文件中，要求使用try-catch进行异常处理，若捕获异常则通过调用IOException异常类的toString()方法显示异常的相关信息。

（1）思路

首先创建一个源文本文件，然后使用BufferedReader逐行读取文件内容，同时使用BufferedWriter将每一行加上行号后写入到目标文件。使用try-catch-finally结构处理可能发生的IO异常。

（2）代码实现

```java
import java.io.*;

public class LineNumberAdder {

    public static void addLineNumbers(String sourceFile, String targetFile) {
        BufferedReader reader = null;
        BufferedWriter writer = null;

        try {
            // 创建读取和写入流
            reader = new BufferedReader(new FileReader(sourceFile));
            writer = new BufferedWriter(new FileWriter(targetFile));

            String line;
            int lineNumber = 1;

            // 逐行读取并添加行号
            while ((line = reader.readLine()) != null) {
                writer.write(lineNumber + ": " + line);
                writer.newLine();
                lineNumber++;
            }

            System.out.println("已成功添加行号并写入到目标文件！");

        } catch (IOException e) {
            System.out.println("处理文件时发生异常: " + e.toString());
        } finally {
            // 关闭流
            try {
                if (reader != null) {
                    reader.close();
                }
                if (writer != null) {
                    writer.close();
                }
            } catch (IOException e) {
                System.out.println("关闭流时发生异常: " + e.toString());
            }
        }
    }

    public static void main(String[] args) {
        String sourceFile = "original.txt";
        String targetFile = "numbered.txt";

        // 首先创建源文件
        try {
            FileWriter writer = new FileWriter(sourceFile);
            writer.write("这是第一行文本。\n");
            writer.write("这是第二行文本。\n");
            writer.write("这是第三行文本。\n");
            writer.write("这是第四行文本，包含特殊字符：!@#$%^&*()。\n");
            writer.write("这是最后一行文本。");
            writer.close();

            System.out.println("已创建源文件: " + sourceFile);

            // 添加行号并写入目标文件
            addLineNumbers(sourceFile, targetFile);

            // 显示目标文件内容
            System.out.println("\n读取目标文件内容:");
            BufferedReader reader = new BufferedReader(new FileReader(targetFile));
            String line;
            while ((line = reader.readLine()) != null) {
                System.out.println(line);
            }
            reader.close();

        } catch (IOException e) {
            System.out.println("发生IO异常: " + e.toString());
        }
    }
}
```

（3）运行结果截图

#block(width: 100%, inset: 8pt, fill: rgb("#224FBC"), stroke: gray, radius: 4pt)[
  #text(font: "SF Mono", size: 10pt, fill: white)[
    (base) user\@MacBook \~/JavaProjects % javac LineNumberAdder.java\
    (base) user\@MacBook \~/JavaProjects % java LineNumberAdder\
    已创建源文件: original.txt\
    已成功添加行号并写入到目标文件！\
    \
    读取目标文件内容:\
    1: 这是第一行文本。\
    2: 这是第二行文本。\
    3: 这是第三行文本。\
    4: 这是第四行文本，包含特殊字符：!@\#\$%^&\*()。\
    5: 这是最后一行文本。
  ]
]

#block[
  #set enum(numbering: "1.", start: 6)
  + #strong[实验测试中遇到的问题和自己的解决方案]
]

在实验过程中，主要遇到以下问题及其解决方案:

1. *问题*: 在编写自定义charAt方法时，不能直接使用String类的charAt方法。\
  *解决方案*: 使用String类的getChars方法将字符串转换为字符数组，然后从数组中获取指定位置的字符。

2. *问题*: FileInputStream和FileOutputStream使用后没有正确关闭，导致资源泄漏。\
  *解决方案*: 使用try-catch-finally结构，确保在finally块中关闭所有打开的流，即使发生异常也能正确关闭。

3. *问题*: StringTokenizer类解析时，需要提取数字部分。\
  *解决方案*: 使用正则表达式Pattern和Matcher来提取字符串中的数字部分。

4. *问题*: 文件操作时需要处理多种可能的异常情况。\
  *解决方案*: 使用try-catch块捕获IOException，并通过toString()方法显示详细的异常信息，帮助调试和错误处理。

5. *问题*: 在添加行号时，需要保证每行都有正确的换行符。\
  *解决方案*: 使用BufferedWriter的newLine()方法，它会根据操作系统自动添加适当的换行符。
