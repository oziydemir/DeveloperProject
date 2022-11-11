public class PatientErrorLog {
    public static void patientError(id patientId, Datetime recDate){
        
        List<Error_Log__c> logs= new List<Error_Log__c>();
        
        Error_Log__c nl=new Error_Log__c();
        nl.Log_Date_Time__c=recDate;
        nl.Log_Details__c='Patient\'s SSN number is incorrect,ID is '+patientId ;
        nl.Log__c='Patient';
        logs.add(nl);
        insert logs;
    }
}
