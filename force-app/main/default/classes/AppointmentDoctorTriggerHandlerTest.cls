@isTest
private class AppointmentDoctorTriggerHandlerTest {
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
        appo.Start_Date_Time__c=Datetime.now().addDays(2);
        appo.End_Date_Time__c=Datetime.now().addDays(4);
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
            static void testValidation(){
        Appointment_Doctor__c systemRec=[SELECT Doctor__c, Appointment__c FROM Appointment_Doctor__c LIMIT 1];
        
        Appointment_Doctor__c appDoc2=new Appointment_Doctor__c();
        appDoc2.Doctor__c=systemRec.Doctor__c;
        appDoc2.Appointment__c=systemRec.Appointment__c;

        test.startTest();
        try {
            insert appDoc2;
        } catch (Exception ex) {
            System.assert(ex.getMessage().contains('FIELD_CUSTOM_VALIDATION_EXCEPTION'));
        }
        test.stopTest();

        Integer systemCount=[SELECT COUNT() FROM Appointment_Doctor__c];
        System.assertEquals(1, systemCount);

    }

        static void negativeTest(){
            Appointment_Doctor__c exRec=[SELECT id FROM Appointment_Doctor__c];
            delete exRec;

            Doctor__c oneDoc=[SELECT id FROM Doctor__c];
            Appointment__c oneAppo=[SELECT id FROM Appointment__c];

            Appointment_Doctor__c newRec= new Appointment_Doctor__c();
            newRec.Doctor__c=oneDoc.id;
            newRec.Appointment__c=oneAppo.id;
            
            test.startTest();
            insert newRec;
            test.stopTest();

            integer countRecords=[SELECT COUNT() FROM Appointment_Doctor__c];
            System.assertEquals(1, countRecords);
        }
}
