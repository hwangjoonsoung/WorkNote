package java;

public class Day02_20 {


    /*
    lamda를 이용한 hashmap 데이터 변경
    Map parameterMap = new HashMap(req.getParameterMap());

    parameterMap.forEach((key, value) -> {
        String [] date =  (String [])value;

        if (key.toString().startsWith("end") && date[0].endsWith("23:59")) {
            String end = date[0] + ":59";
            parameterMap.put(key, end);
            } else {
            parameterMap.put(key, date[0]);
            }
        });

    참고 :
    arraylist에서 사용하는 stream과 map에서 사용하는 stream은 다르다.
        ex) arrayList.stream().forEach();
            map.forEach();
    */

}
