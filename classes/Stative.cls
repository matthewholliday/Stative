public class Stative {
    public static void addContract(String contractName, String contractValue){
        if(!contractExists(contractName)){
            sanantonioapps__Stative__c newContract = new sanantonioapps__Stative__c(Name=contractName,sanantonioapps__Class_Name__c=contractValue);
            insert newContract;
        }
    }
    
    public static Boolean contractExists(String contractName){
        List<sanantonioapps__Stative__c> contracts = new List<sanantonioapps__Stative__c>();
        contracts = [SELECT Id FROM sanantonioapps__Stative__c WHERE Name = :contractName];
        if(contracts.size() > 0){
            return true;
        }
        return false;
    }
    
    public static void deleteContract(String contractName){
        List<sanantonioapps__Stative__c> contracts = new List<sanantonioapps__Stative__c>();
        contracts = [SELECT Id FROM sanantonioapps__Stative__c WHERE Name = :contractName];
        delete contracts;
    }
    
    public static String getContractValue(String contractName){
        List<sanantonioapps__Stative__c> contracts = new List<sanantonioapps__Stative__c>();
        contracts = [SELECT sanantonioapps__Class_Name__c FROM sanantonioapps__Stative__c WHERE Name = :contractName];        
        if(contracts.size() > 0)
        	return contracts[0].sanantonioapps__Class_Name__c;
        else {
            return null;
        }
    }
    
    public static Object getDependency(String contractName){
    	return Type.forName(sanantonioapps__Stative__c.getInstance(contractName).sanantonioapps__Class_Name__c).newInstance();
    }
    
    public static void updateContract(String contractName, String contractValue){
        List<sanantonioapps__Stative__c> contracts = new List<sanantonioapps__Stative__c>();
        contracts = [SELECT sanantonioapps__Class_Name__c FROM sanantonioapps__Stative__c WHERE Name = :contractName];   
        if(contracts.size() > 0){
            contracts[0].sanantonioapps__Class_Name__c = contractValue;
            update contracts[0];
        }        
    }
    
    public static void upsertContract(String contractName, String contractValue){
         if(contractExists(contractName)){
            updateContract(contractName,contractValue);
         } else {
         	addContract(contractName,contractValue);           
         }
    }
}