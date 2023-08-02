import com.sun.org.apache.xalan.internal.xsltc.dom.SortingIterator;
import com.sun.xml.internal.ws.api.pipe.Engine;
import javafx.scene.web.HTMLEditor;

import javax.script.ScriptEngine;
import javax.script.ScriptEngineFactory;
import javax.script.ScriptEngineManager;
import javax.swing.text.html.HTML;
import javax.swing.text.html.HTMLDocument;
import javax.swing.text.html.HTMLWriter;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.*;

public class test {
    private static final String CONTENT_TYPE = "application/json;charset=UTF-8";
    public static void main(String[] args) throws IOException {

        String url = "https://www.naver.com/";

        URL urlConTest = new URL(url);
        HttpURLConnection httpURLConnection = (HttpURLConnection) urlConTest.openConnection();
        httpURLConnection.setRequestProperty("CONTENT_TYPE" , CONTENT_TYPE);



        Object o = httpURLConnection.getContent();
        int ch;
        while((ch=((InputStream)o).read()) != -1) {
            System.out.print((char) ch);
        }
        httpURLConnection.disconnect();




}}

