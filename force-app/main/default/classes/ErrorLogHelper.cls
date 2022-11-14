public class ErrorLogHelper {
    public static void ErrorLog(string processName, String logDetails){
        
        Error_Log__c nl=new Error_Log__c();
        nl.Log_Details__c=logDetails;
        nl.Log__c=processName;
        
        insert nl;
    }
}
