@isTest
public class DeleteTwoMonthsAppointmentsTest {
    @TestSetup
    static void makeData(){
        Clinic_Manager__c tcm = new Clinic_Manager__c();
        tcm.Name='Test Manager';
        tcm.Phone__c='123456789';
        tcm.Email__c='tcm@gmail.com';
        insert tcm;

        List<Appointment__c> appoList=new List<Appointment__c>();
        for (Integer i = 0; i < 400; i++) {
            Appointment__c tap = new Appointment__c();
            tap.Clinic_Manager__c=tcm.Id;
            tap.Live__c=false;
            tap.Maximum_number_of_patients__c=10;
            tap.Start_Date_Time__c=Datetime.now().addMonths(-4);
            tap.End_Date_Time__c=Datetime.now().addMonths(-3);
            tap.Name__c='Test'+i;
            appoList.add(tap);
        } insert appoList;
    }
    @isTest
    private static void testMethod1(){
        test.startTest();
        DeleteTwoMonthsAppointments del=new DeleteTwoMonthsAppointments();
        Database.executeBatch(del, 401);
        test.stopTest();

        integer countAppointments=[SELECT COUNT () FROM Appointment__c];
        System.assertEquals(0, countAppointments);

    }
}
