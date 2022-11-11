@isTest
public class AppointmentDoctorTriggerHandlerTest {
    @TestSetup
    static void makeData(){
        Clinic_Manager__c cm=new Clinic_Manager__c();
        cm.Phone__c='111111111';
        cm.Name='Test Manager';
        cm.Email__c='testManager@gma.com';
        insert cm;
        
        Appointment__c appo=new Appointment__c();
        appo.Name__c='Surgery';
        appo.Live__c=true;
        appo.Start_Date_Time__c=Date.newInstance(2022, 11, 10);
        appo.End_Date_Time__c=Date.newInstance(2022, 11, 12);
        appo.Maximum_number_of_patients__c=10;
        appo.Clinic_Manager__c=cm.Id;
        insert appo;

        Doctor__c doc=new Doctor__c();
        doc.Name='Test Doc';
        doc.Phone__c='123123123';
        doc.Email__c='testdoc@gma.com';
        insert doc;

        Appointment_Doctor__c newAppDoc=new Appointment_Doctor__c();
        newAppDoc.Doctor__c=doc.Id;
        newAppDoc.Appointment__c=appo.Id;
        insert newAppDoc;
    }
@isTest
    private static void testValidation(){
        
        Doctor__c doc=[SELECT id FROM Doctor__c LIMIT 1];
        Appointment__c app=[SELECT id FROM Appointment__c LIMIT 1];
       
        Appointment_Doctor__c appDoc2=new Appointment_Doctor__c();
        appDoc2.Doctor__c=doc.Id;
        appDoc2.Appointment__c=app.Id;

        test.startTest();
        try {
            insert appDoc2;
        } catch (Exception ex) {
            System.assert(ex.getMessage().contains('FIELD_CUSTOM_VALIDATION_EXCEPTION'));
        }
        test.stopTest();

    }
}
