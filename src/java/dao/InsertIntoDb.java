
package dao;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.Reader;
import org.jsoup.Jsoup;


public class InsertIntoDb 
{
    InsertIntoDb(){}
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
}
