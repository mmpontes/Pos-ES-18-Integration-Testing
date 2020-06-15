package definition;

import groovy.json.internal.LazyMap;

public class Processo {
    private static final String URL_USER = "http://agapito-server.herokuapp.com/processos";
    private static LazyMap fieldsJson = new LazyMap();
    private static String lastProcess;

    public static void addFields(String field, String value) {
        fieldsJson.put(field, value);
    }

    public static void clearfields() {
        fieldsJson.clear();
    }

    public static LazyMap getFields() {
        return fieldsJson;
    }

    public static String getEndPoint() {
        return URL_USER;
    }

    public static String getLastProcess() {
        return lastProcess;
    }

    public static void setLastProcess(String id) {
        lastProcess = id;
    }

}
