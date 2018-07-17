package online;
import java.io.IOException;
import java.io.FileReader;
import java.io.Reader;
import java.io.BufferedReader;
import org.jsoup.Jsoup;
import myconnection.MyCon;
import java.sql.*;
import java.util.*;
import dao.*;
import java.io.File;

public class InsertIntoDbMain
{
  InsertIntoDbMain(){}

  public static String extractText(Reader reader) throws IOException
  {
    StringBuilder sb = new StringBuilder();
    BufferedReader br = new BufferedReader(reader);
    String line;
    while ( (line=br.readLine()) != null) {
      sb.append(line);
    }
    String textOnly = Jsoup.parse(sb.toString()).text();
    return textOnly;
  }

  public final static void main(String[] args) throws Exception
  {
      for (int j = 114; j <=120; j++) {
          
   //   File file = new File("C:/Users/Nice/Downloads/Result Html Pages/"+j+".html");
     // if (!file.isDirectory())
      //file = file.getParentFile();
      //if (file.exists()){
      FileReader reader = new FileReader("C:\\Users\\Nice\\Downloads\\Result Html Pages\\00Results\\CBCSNEW/45.html");
//      String s1=InsertIntoDb.extractText(reader);
//      String[] words=s1.split("\\s"); 
        String rno=null,branch,status,semester,session1;
          int rnofrom,rnoto,count=1;
    int i=30,finalresultgrace=0,finalresultfail=0,casesub=1;
      String s1=null;
      s1=InsertIntoDb.extractText(reader);
      s1=s1.replace("with", "");
      String[] words=s1.split("\\s"); 
      ReadHtml readhtml= new ReadHtml();
       for ( int k=i ; i < words.length; i++)
      {
       if(words[i].equalsIgnoreCase("name"))    
       { 
         if(words[i+2].equalsIgnoreCase("Roll"))  
         { readhtml.setName(words[i+1]);
           System.out.println(words[i+1]);
          }
         else
           if(words[i+3].equalsIgnoreCase("Roll"))  
           {readhtml.setName(words[i+1] + " " + words[i+2] );
               System.out.println(words[i+1] + " " + words[i+2] );
           }
           
         else
             readhtml.setName(words[i+1] + " " + words[i+2] + " " + words[i+3] );  
         
           break;
      }
   }
        //****************Enrollment Number************************
       for (int k=i; i < words.length; i++)
      {

       if(words[i].equalsIgnoreCase("Roll"))  
       {
          
         rno=words[i+2].substring(0,Math.min(12,words[i+2].length())); 
         readhtml.setRollno(words[i+2].substring(0,Math.min(12,words[i+2].length())));
           System.out.println(words[i+2].substring(0,Math.min(12,words[i+2].length())));
         break;
         
       }
      }
     
          //****************Course************************
//        for ( int k=i ; i < words.length; i++)
//      {
//       if(words[i].equalsIgnoreCase("course"))    
//       {    
//           readhtml.setCourse(words[i+1]);
//           break;
//       }
//      }
          readhtml.setCourse("BE");
         //****************Branch************************  
        for ( i=10 ; i < words.length; i++)
      {
       if(words[i].equalsIgnoreCase("branch"))    
       {    
       readhtml.setBranch(words[i+1].substring(0,Math.min(2,words[i+1].length())));
       System.out.println(words[i+1].substring(0,Math.min(2,words[i+1].length()))); 
       break;
       }
      }
        
        //****************Semester************************   
        for ( int k=i ; i < words.length; i++)
      {
       if(words[i].equalsIgnoreCase("semester"))    
       {    
       readhtml.setSem(words[i+1].substring(0,Math.min(1,words[i+1].length()))) ;
           System.out.println(words[i+1].substring(0,Math.min(1,words[i+1].length())));
           break;
       }
      }
        
         //****************Status************************  
       for ( int k=i ; i < words.length; i++)
      {
       if(words[i].equalsIgnoreCase("status"))    
       {    
       readhtml.setStatus(words[i+1]);
           System.out.println(words[i+1]);
           break;
       }
      }
     
        //****************Subject 1************************
      for (int k=i; i < words.length; i++){
      
       if(words[i].equals("A")||words[i].equals("A+")||words[i].equals("B")||words[i].equals("B+")||words[i].equals("C")||words[i].equals("C+")||words[i].equals("C##")||words[i].equals("D")||words[i].equals("D##")||words[i].equals("D+")||words[i].equals("F")){
       
          if(words[i].equals("C##")||words[i].equals("D##"))
               finalresultgrace=1;
           if(words[i].equals("F"))
               finalresultfail=1;
          switch(casesub)
         {
              case 1:
              {
                  readhtml.setSub1(words[i]);
                  System.out.println(words[i]);
                  casesub++;
                  break;
              } 
              case 2:
              {
                  readhtml.setSub2(words[i]);
                  System.out.println(words[i]);
                  casesub++;
                  break;
              } 
              case 3:
              {
                  readhtml.setSub3(words[i]);
                  casesub++;
                  break;
              } 
              case 4:
              {
                  readhtml.setSub4(words[i]);
                  casesub++;
                  break;
              } 
              case 5:
              {
                  readhtml.setSub5(words[i]);
                  casesub++;
                  break;
              } 
              case 6:
              {
                  readhtml.setSub6(words[i]);
                  casesub++;
                  break;
              } 
              case 7:
              {
                  readhtml.setSub7(words[i]);
                  casesub++;
                  break;
              } 
              case 8:
              {
                  readhtml.setSub8(words[i]);
                  casesub++;
                  break;
              } 
              case 9:
              {
                  readhtml.setSub9(words[i]);
                  casesub++;
                  break;
              } 
              case 10:
              {
                  readhtml.setSub10(words[i]);
                  casesub++;
                  break;
              } 
              case 11:
              {
                  readhtml.setSub11(words[i]);
                  casesub++;
                  break;
              } 
              case 12:
              {
                  readhtml.setSub12(words[i]);
                  casesub++;
                  break;
              } 
              case 13:
              {
                  readhtml.setSub13(words[i]);
                  casesub++;
                  break;
              } 
              case 14:
              {
                  readhtml.setSub14(words[i]);
                  casesub++;
                  break;
              } 
              case 15:
              {
                  readhtml.setSub15(words[i]);
                  casesub++;
                  break;
              } 
              case 16:
              {
                  readhtml.setSub16(words[i]);
                  casesub++;
                  break;
              } 
         } 
       }
      }
      
     //****************Result************************
        if(finalresultfail==1) 
        readhtml.setResult("FAIL"); 
        else
        if(finalresultgrace==1) 
        readhtml.setResult("PASS WITH GRACE");
        else       
        readhtml.setResult("PASS"); 
        
            
      //****************Sgpa & Cgpa************************
         for (int k=70; k < words.length; k++)
      {
       
       if(words[k].equalsIgnoreCase("sgpa"))    
        {
           for ( i =k; i < words.length; i++) {
           if(Character.isDigit(words[i].charAt(0)))
            {
                System.out.println("in if");
              if(Character.isDigit(words[i].charAt(2)))
              {
                  System.out.println("in if 2");
                readhtml.setSgpa(words[i]);
                System.out.println(words[i]);
                readhtml.setCgpa(words[i+1]);  
                System.out.println(words[i+1]);  
                break;        
              }
            }
           }
           break;
        
        }
      }
         ReadHtmlDAO rdao = new ReadHtmlDAO();
         if(rdao.insertData(readhtml))
          System.out.println("Record Inserted");
          else
          System.out.println("Record Not Inserted");
       
      }
//      for (int i = 40; i < words.length; i++)
//      {
//       if(words[i].equalsIgnoreCase("name"))    
//       rd.setName(words[i+1] + " " + words[i+2] );
//      }
//      
//      rd.setRollno(words[45]);
//      rd.setBranch(words[49]);
//      rd.setSem(words[51]);
//      rd.setCS501_T(words[64]);
//      rd.setCS502_T(words[69]);
//      rd.setCS503_T(words[74]);
//      rd.setCS504_T(words[79]);
//      rd.setCS505_T(words[84]);
//      rd.setCS502_P(words[89]);
//      rd.setCS503_P(words[94]);
//      rd.setCS504_P(words[99]);
//      rd.setCS506_P(words[104]);
//      rd.setCS507_P(words[109]);
//      rd.setCS508_P(words[114]);
//      rd.setResult(words[119]);
//      if(words[120].equalsIgnoreCase("with"))
//      rd.setSgpa(words[122]);
//      else
//      rd.setSgpa(words[120]);
//      if(words[121].equalsIgnoreCase("grace"))
//      rd.setCgpa(words[123]);
//      else
//      rd.setCgpa(words[121]);
//      ReadHtmlDAO rdao = new ReadHtmlDAO();
//       rd.setBranch("CS");
//       
//       for ( int k=i ; i < words.length; i++)
//      {
//       if(words[i].equalsIgnoreCase("name"))    
//       {    
//       rd.setName(words[i+1] + " " + words[i+2] );
//           System.out.println(i);break;
//       }
//      }
//      for (int k=i; i < words.length; i++)
//      {
//       if(words[i].equalsIgnoreCase("Roll"))  
//       {
//         System.out.println(i); 
//         rd.setRollno(words[i+2]);
//         rd.setRollno(words[42]);break;
//       }
//      }
//      rd.setRollno(words[42]);
//      rd.setSem("5");
//      for (int k=i; i < words.length; i++)
//      {
//       if(words[i].equalsIgnoreCase("CS501-"))
//       {
//       rd.setCS501_T(words[i+4]);System.out.println(i);break;
//       }
//      }
//      for (int k=i; i < words.length; i++)
//      {
//       if(words[i].equalsIgnoreCase("CS502-"))
//       {  
//         rd.setCS502_T(words[i+4]);System.out.println(i);break;
//       }
//      }
//      for (int k=i; i < words.length; i++)
//      {
//       if(words[i].equalsIgnoreCase("CS503-"))    
//       {   
//        rd.setCS503_T(words[i+4]);System.out.println(i);
//        break;
//       }
//      }
//      for (int k=i; i < words.length; i++)
//      {
//       if(words[i].equalsIgnoreCase("CS504-"))   
//       {    
//        rd.setCS504_T(words[i+4]);
//        System.out.println(i);break;
//       }
//      }
//      for (int k=i; i < words.length; i++)
//      {
//       if(words[i].equalsIgnoreCase("CS505-"))    
//       {
//         rd.setCS505_T(words[i+4]);
//         System.out.println(i);break;
//       }
//     }
//     
//      for (int k=i; i < words.length; i++)
//      {
//       if(words[i].equalsIgnoreCase("CS502-"))    
//       {
//       rd.setCS502_P(words[i+4]);
//       System.out.println(i);break;
//       }
//      }
//      for (int k=i; i < words.length; i++)
//      {
//       if(words[i].equalsIgnoreCase("CS503-"))   
//       {    
//       rd.setCS503_P(words[i+4]);
//       System.out.println(i);break;
//       }
//      }
//      for (int k=i; i < words.length; i++)
//      {
//       if(words[i].equalsIgnoreCase("CS504-")) 
//       {
//       rd.setCS504_P(words[i+4]);
//       System.out.println(i);break;
//       }
//      }
//      for (int k=i; i < words.length; i++)
//      {
//       if(words[i].equalsIgnoreCase("CS506-"))    
//       {    
//       rd.setCS506_P(words[i+4]);
//       System.out.println(i);break;
//       }
//      }
//      for (int k=i; i < words.length; i++)
//      {
//       if(words[i].equalsIgnoreCase("CS507-"))    
//       {
//       rd.setCS507_P(words[i+4]);
//       System.out.println(i);break;
//       }
//      }
//      for (int k=i; i < words.length; i++)
//      {
//       if(words[i].equalsIgnoreCase("CS508-"))   
//       {   
//        rd.setCS508_P(words[i+4]);
//        System.out.println(i);break;
//       }
//      }
     
//      for (int k=i; i < words.length; i++)
//      {
//       if(words[i].equalsIgnoreCase("result"))    
//       {
//        if(words[i+5].equalsIgnoreCase("with"))
//       
//          rd.setResult(words[i+4] + " " + words[i+5] + " " + words[i+6]);
//        else
//        {    
//        rd.setResult(words[i+4]);break;
//        }
//       }
//      }
//        for (int k=i; i < words.length; i++)
//      {
//       if(words[i].equalsIgnoreCase("sgpa"))    
//       {
//        if(words[i+3].equalsIgnoreCase("with"))
//        rd.setSgpa(words[i+5]);
//        else
//        rd.setSgpa(words[i+3]);break;
//       }
//      }
//        for (int k=i; i < words.length; i++)
//      {
//       if(words[i].equalsIgnoreCase("cgpa"))    
//       {
//        if(words[i+3].equalsIgnoreCase("grace"))
//        rd.setCgpa(words[i+5]);
//        else
//        rd.setCgpa(words[i+3]);break;
//       }
//      }
//        ReadHtmlDAO rdao = new ReadHtmlDAO();
//      if(rdao.insertData(rd))
//          System.out.println("Record Inserted");
//      else
//          System.out.println("Record Not Inserted");
//       
//      } 
//    }
//***********Search ALL RECORD**************

//     ReadHtmlDAO  rd = new ReadHtmlDAO();
//        List <ReadHtml>myresultlist= new ArrayList<ReadHtml>();
//        myresultlist = rd.searchAllStudent();
//        for(ReadHtml R: myresultlist)
//        {
//           
//                System.out.println(R.getRollno());
//                System.out.println(R.getName());
//                System.out.println(R.getCS501_T());
//                System.out.println(R.getCS502_T());
//                System.out.println(R.getCS503_T());
//                System.out.println(R.getCS504_T());
//                System.out.println(R.getCS505_T());
//                System.out.println(R.getCS502_P());
//                System.out.println(R.getCS503_P());
//                System.out.println(R.getCS504_P());
//                System.out.println(R.getCS506_P());
//                System.out.println(R.getCS507_P());
//                System.out.println(R.getCS508_P());
//                System.out.println(R.getResult());
//                System.out.println(R.getSgpa());
//                System.out.println(R.getCgpa());
//        }  
                
                
      
      

//        System.out.print(words[41] + "fname");      
//        System.out.println(words[42] + "lname");    
//        System.out.println(words[45] + " Rollno");    
//        System.out.println(words[64] + " T-501");
//        System.out.println(words[69] + " T-502");
//        System.out.println(words[74] + " T-503");
//        System.out.println(words[79] + " T-504");
//        System.out.println(words[84] + " T-505");
//        System.out.println(words[89] + " P-502");
//        System.out.println(words[94] + " P-503");
//        System.out.println(words[99] + " P-504");
//        System.out.println(words[104] + " P-506");
//        System.out.println(words[109] + " P-507");
//        System.out.println(words[114] + " P-508");
//        System.out.println("  " + words[119] + "pass");
//        System.out.println("  " + words[120] + "sgpa");
//        System.out.println("  " + words[121] + "cgpa");
       
        
  }   
 
  }


