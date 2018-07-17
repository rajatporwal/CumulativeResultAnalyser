
package online;
import java.io.IOException;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class UsingJsoup {
    


   public static void main(String[] args) 
   {
      String html = "file:///C:/Users/Nice/Downloads/Result Html Pages/91.html";
      try {
         Document doc = Jsoup.connect(html).get();
         Elements tableElements = doc.select("table");
         
      //   Elements tableElements = doc.select("div.resultheader");

         Elements tableHeaderEles = tableElements.select("thead tr th");
        System.out.println("headers");
         for (int i = 0; i < tableHeaderEles.size(); i++) {
            System.out.println(tableHeaderEles.get(i).text());
         }
         System.out.println();

         Elements tableRowElements = tableElements.select(":not(thead) tr");

         for (int i = 0; i < tableRowElements.size(); i++) {
            Element row = tableRowElements.get(i);
          //  System.out.println("row");
            Elements rowItems = row.select("td");
            for (int j = 0; j < rowItems.size(); j++) {
              System.out.println(rowItems.get(j).text());
            }
            System.out.println();
         }
     
         Elements authors = doc.getElementsByClass("div.gridtable");
		for(Element author : authors){
			
                    System.out.println(author.attributes());

       } 
      }
      
      catch (Exception e) 
      {
          System.out.println(e);;
      }
   }
}
    

