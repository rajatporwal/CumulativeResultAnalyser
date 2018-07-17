import java.io.IOException;
import java.io.FileReader;
import java.io.Reader;
import java.io.BufferedReader;
import java.util.*;
import org.jsoup.Jsoup;

public class HTMLUtils {
  private HTMLUtils() {}

  public static String extractText(Reader reader) throws IOException {
    StringBuilder sb = new StringBuilder();
    BufferedReader br = new BufferedReader(reader);
    String line;
    while ( (line=br.readLine()) != null) {
      sb.append(line);
    }
    String textOnly = Jsoup.parse(sb.toString()).text();
    return textOnly;
  }

  public final static void main(String[] args) throws Exception{
//    FileReader reader = new FileReader
//          ("C:\\Users\\Nice\\Downloads\\Result Html Pages\\00Results/45.html");
    FileReader reader = new FileReader("C:\\Users\\Nice\\Downloads\\Result Html Pages\\00Results\\3rd SEM CS 2015BATCH/96.html");
     //  System.out.println(HTMLUtils.extractText(reader));
        String s1=HTMLUtils.extractText(reader);
        String[] words=s1.split("\\s"); 
      //  List<String> list=new ArrayList<String>(Arrays.asList(words));
     
         
      
      
        for (int i = 1; i < 167; i++)
        {
         
             System.out.println(words[i] + i);
//            if(words[i].equalsIgnoreCase("with"))
//            System.out.println(words[i+2] + " " +i);
//            
//            if(words[i].equalsIgnoreCase("grace"))
//             System.out.println(words[i+2] + " " +i);
//            else
//                System.out.println(words[i] + " " + i);   
       }
        for (int i = 1; i < words.length;i++)
        {
            if(words[i].equals("A")||words[i].equals("A+")||words[i].equals("B")||words[i].equals("B+")||words[i].equals("C")||words[i].equals("C+")||words[i].equals("C##")||words[i].equals("D")||words[i].equals("D##")||words[i].equals("D+")||words[i].equals("F"))
            System.out.println(words[i]) ;
        }
//      for (int k=70; k < words.length; k++)
//      {
//       
//       if(words[k].equalsIgnoreCase("sgpa"))    
//        {
//            System.out.println(words[k]);
//           for (int i =k; i < words.length; i++) {
////           if(Character.isDigit(words[i].charAt(0)))
//           if(words[i].equalsIgnoreCase("2.69"))
//            {
//                System.out.println(words[i] + i);
//                System.out.println("in if");
//              if(Character.isDigit(words[i].charAt(2)))
//              {
//                  System.out.println("in if 2");
//                System.out.println(words[i] + " " +i);
//                System.out.println(words[i+1] + " " + i+1);  
//                break;        
//              }
//            }
//           }
//           break;
//        
//        }   
//    }  
        
      } 
        
        
//        System.out.print(words[41] + "fname");      
//        System.out.println(words[42] + "lname");    
//        System.out.println(words[45] + " Rollno");    
//        System.out.println(words[49] + " Branch");    
//        System.out.println(words[51] + " Sem");    
//      //  System.out.println(words[57] + " T-501");    
//   //     System.out.print(words[60] + "rollno");
//        System.out.println(words[64] + " T-501");
//    //    System.out.print(words[65] + "rollno");
//        System.out.println(words[69] + " T-502");
//    //    System.out.print(words[70] + "rollno");
//        System.out.println(words[74] + " T-503");
//   //     System.out.print(words[75] + "rollno");
//        System.out.println(words[79] + " T-504");
//    //    System.out.print(words[80] + "rollno");
//        System.out.println(words[84] + " T-505");
//   //   System.out.print(words[85] + "rollno");
//        System.out.println(words[89] + " P-502");
//  //      System.out.print(words[90] + "rollno");
//        System.out.println(words[94] + " P-503");
//   //     System.out.print(words[95] + "rollno");
//        System.out.println(words[99] + " P-504");
//   //     System.out.print(words[100] + "rollno");
//        System.out.println(words[104] + " P-506");
//   //     System.out.print(words[105] + "rollno");
//        System.out.println(words[109] + " P-507");
//   //     System.out.print(words[110] + "rollno");
//        System.out.println(words[114] + " P-508");
//        System.out.print(words[115] + "Result");
//        System.out.println("  " + words[119] + "pass");
//       // System.out.print(words[117] + "rollno");
//        if(words[120].equalsIgnoreCase("with"))
//            System.out.println("  " + words[122] + "sgpa");
//        else
//       System.out.println("  " + words[120] + "sgpa");
//      //  System.out.print(words[118] + "rollno");
//      if(words[121].equalsIgnoreCase("grace"))
//        System.out.println("  " + words[123] + "cgpa");
//      else
//          System.out.println("  " + words[121] + "cgpa");
//       
        
//        for(String w:words)
//        {  
//        //  System.out.println(w);  
//        }
  }