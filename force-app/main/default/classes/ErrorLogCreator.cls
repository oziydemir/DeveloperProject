public with sharing class ErrorLogCreator {
    public static void ErrorLog(string processName, String logDetails){
        
        Error_Log__c nl=new Error_Log__c();
        nl.Log_Details__c=logDetails;
        nl.Log__c=processName;
        nl.Log_Date_Time__c=nl.CreatedDate;
        
        insert nl;
    }
}
