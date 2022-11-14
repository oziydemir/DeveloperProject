public  class DeleteTwoMonthsAppointments implements Database.Batchable <sObject>, Database.Stateful {
    public Database.QueryLocator start(Database.BatchableContext bc){
        Database.QueryLocator q1 = Database.getQueryLocator([SELECT id,End_Date_Time__c,Live__c FROM Appointment__c]);        
        return q1;

    }

    public void execute(Database.BatchableContext bc, List<Appointment__c> la){
        List<Appointment__c> forDeleting=new List<Appointment__c>();
        Datetime criteriaDateTime=Datetime.now().addMonths(-2);
        for (Appointment__c eachApp : la) {
            if (eachApp.End_Date_Time__c<criteriaDateTime && eachApp.Live__c==false) {
                forDeleting.add(eachApp);
            }
        }
        delete forDeleting;
    }

    public void finish(Database.BatchableContext bc){
        //send an email to public groups.

    }
}
