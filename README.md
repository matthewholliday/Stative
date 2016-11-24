Stative is a simple dependency injection container for Salesforce.

Example usage:

Consider the following interface and concrete class:

public class MyClassA implements IMyClassA{
    public String getHelloWorld(){
        return 'Hello World';
    }
}

public interface IMyClassA {
	String getHelloWorld();
}

The dependency can be injected in the following manner:

//Register a contract with the container.
Stative.addContract('IMyClassA', 'MyClassA');
        
//Get an instance of the dependency from the container.
IMyClassA myObjectA = (IMyClassA)Stative.getDependency('IMyClassA');
        
//myObjectA is an instance of the 'MyClassA' concrete class
System.debug(myObjectA.getHelloWorld()); // ==> 'Hello World'


The Stative class exposes the following methods for managing dependencies:

* public static void addContract(String contractName, String contractValue)
* Boolean contractExists(String contractName)  
* void deleteContract(String contractName)
* String getContractValue(String contractName) 
* void getDependency(String contractName)
* void updateContract(String contractName, String contractValue)
* void upsertContract(String contractName, String contractValue)
