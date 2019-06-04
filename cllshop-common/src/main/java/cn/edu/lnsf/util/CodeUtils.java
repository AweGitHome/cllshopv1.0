package cn.edu.lnsf.util;

import java.util.Random;

public class CodeUtils {
    public static void main(String[] args){
        System.out.println(getCode());
    }
    public static String getCode(){
        Random random = new Random();
        StringBuilder sb = new StringBuilder();
        for(int i = 0; i < 6; i++){
            sb.append(""+random.nextInt(9));
        }
        return sb.toString();
    }
}
