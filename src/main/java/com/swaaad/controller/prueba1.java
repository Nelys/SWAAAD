package com.swaaad.controller;

import java.io.IOException;
import java.util.logging.FileHandler;
import java.util.logging.Logger;
import java.util.logging.SimpleFormatter;

import javax.script.ScriptEngine;
import javax.script.ScriptEngineManager;

public class prueba1 {

    public static void main(String[] args) throws Exception  {
        
        ////////////////////////////////////////////////////////
        ScriptEngineManager manager = new ScriptEngineManager();
        ScriptEngine engine = manager.getEngineByName("js");
        engine.put("Tarea1", 20);
        engine.put("Tarea2", 14);
        engine.put("Tarea3", 18);
        try {
            
            //Object operation2 = engine.eval("((((((Tarea1))))) + Tarea2 + Tarea3) / 3 ");
            //Object operation = engine.eval("5*X+3*2");
            Object operation2 = engine.eval("Tarea1 * 0.3 + Tarea2 * 0.3 + Tarea3 * 0.4");
            //Object operation2 = engine.eval("(X+(X*(X+X)+3)");
     
            //System.out.println("Evaluado operacion 1: " + operation);
            System.out.println("Evaluado operacion 2: " + operation2);
        } catch (Exception e) {
            System.out.println(e);
        }
        
        ////////////////////////////////////////////////////////////
        
        /*try {
            String expression = "3+4";
            Object result = engine.eval(expression);
            System.out.println(expression+" = "+result);
        } catch(Exception se) {
            se.printStackTrace();
        }*/
//        Logger logger = Logger.getLogger("MyLog");  
//        FileHandler fh;  
//
//        try {  
//
//            // This block configure the logger with handler and formatter  
//            fh = new FileHandler("C:/Users/Tom/MyLogFile.log");  
//            logger.addHandler(fh);
//            SimpleFormatter formatter = new SimpleFormatter();  
//            fh.setFormatter(formatter);  
//
//            // the following statement is used to log any messages  
//            logger.info("My first log");  
//
//        } catch (SecurityException e) {  
//            e.printStackTrace();  
//        } catch (IOException e) {  
//            e.printStackTrace();  
//        }  
//
//        logger.info("Hi How r u?");  
    }

}
