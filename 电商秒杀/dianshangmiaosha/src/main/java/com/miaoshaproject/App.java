package com.miaoshaproject;

import com.miaoshaproject.dao.UserDOMapper;
import com.miaoshaproject.dataobject.UserDO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import tk.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.ComponentScan;
import java.lang.*;

/**
 * Hello world!
 *
 */


//@SpringBootApplication(scanBasePackages={"com.miaoshaproject"})
    @SpringBootApplication
@RestController
@MapperScan("com.miaoshaproject.dao")

public class App 
{
    @Autowired
    private UserDOMapper userDOMapper;

    @RequestMapping("/hello")
    public String home(){
        UserDO userDO=userDOMapper.selectByPrimaryKey(1);
        if(userDO==null){
            return "用户对象不存在";
        }else{
            return userDO.getNames();
        }
    }

    public static void main( String[] args )
    {
        System.out.println( "Hello World!" );
        SpringApplication.run(App.class ,args);
    }
}
