public with sharing class ContactsListController {
    private String sortOrder = 'LastName';
   
    // Extension Liccense Checker
    public boolean getIsLicensed() {
        boolean isLicensed;
        
        try {
            isLicensed = UserInfo.isCurrentUserLicensed('NAMESPACE OF YOUR EXTENSION PACKAGE');
        } catch(Exception e) {
            System.debug('DBG:' + e);
           isLicensed = false;   
        }
        return isLicensed;
    }
   
    // List of Contacts
    public List<Contact> getContacts() {
       
       List<Contact> results = Database.query(
           'SELECT Id, FirstName, LastName, Title, Email ' +
           'FROM Contact ' +
           'ORDER BY ' + sortOrder + ' ASC ' +
           'LIMIT 10'
       );
       return results;
   }
}