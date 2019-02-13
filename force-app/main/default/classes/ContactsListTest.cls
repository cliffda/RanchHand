@isTest
private class ContactsListTest {
       
    @isTest static void MyTest() {

        //Define the variable used to track the number of records
        integer numberOfRecords = 0;
        
        // Create our test data - eliminates risk that pre-existing data in the org will 
        // return unexpected results.
        Contact testContact = new Contact();
        testContact.LastName = 'Smith';
        testContact.FirstName = 'Pat';
        //The next line will insert test data - remove the // marks to make it active.
        insert testContact;
            
        // Create a new instance (object) from the class ContactListController
        // We named it myController
        ContactsListController myController = new ContactsListController();
        
        // This line calls the getContact method in the VF Controller class.  The getContact method returns
        // a list of Contct records.  The .size() method will tell us the number of contact records
        // in the list.  We'll save that value in the variable numberOfRecords.
        numberOfRecords = myController.getContacts().size();

        //boolean isLicenseTestResult = myController.getIsLicensed();
        
        // This is essential for all test methods - it's what actually checks to see if the test passed
        // or failed.
        System.assert(numberOfRecords > 0,'Expected > 0, actual=' + numberOfRecords);
    }
    
}