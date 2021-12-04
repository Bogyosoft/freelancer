package com.bogyo.freelancer;

import com.google.common.io.Files;

import java.io.File;
import java.io.IOException;
import java.nio.charset.Charset;

public class TestDataLoader {

    public String loadTestData(String testData){
        try{
            return Files.asCharSource(new File("src/test/resources/test-data/" + testData), Charset.defaultCharset()).read();
        } catch (IOException e ){
            System.out.println("failed to read testdata");
        }
        return null;
    }
}
