package cc.c2appstore.config;

import com.baomidou.mybatisplus.extension.plugins.PaginationInterceptor;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Profile;

/**
 * @author: changcan
 * @date: 2021/10/25 23:44
 */
@Configuration
@MapperScan("cc.c2appstore.mapper*")
public class MybatisPlusConfig {
//    @Bean
//    @Profile({"dev","test"})
//    public PerformanceInterceptor performanceInterceptor(){
//
//    }

    @Bean
    public PaginationInterceptor paginationInterceptor(){
        return new PaginationInterceptor();
    }
}
