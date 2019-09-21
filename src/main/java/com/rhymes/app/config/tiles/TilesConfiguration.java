package com.rhymes.app.config.tiles;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.view.tiles3.TilesConfigurer;
import org.springframework.web.servlet.view.tiles3.TilesView;
import org.springframework.web.servlet.view.tiles3.TilesViewResolver;

@Configuration
public class TilesConfiguration {
	
	@Bean
    public TilesConfigurer tilesConfigurer() {
        final TilesConfigurer configurer = new TilesConfigurer();
        
        String[] xmls = {"/WEB-INF/tiles/common/CommonTiles.xml"
        				, "/WEB-INF/tiles/common/ErrorTiles.xml"
        				, "/WEB-INF/tiles/member/MemberTiles.xml"
        				
        				};
        
        //해당 경로에 tiles.xml 파일을 넣음
        configurer.setDefinitions(xmls);
        configurer.setCheckRefresh(true);
        return configurer;
    }

    @Bean
    public TilesViewResolver tilesViewResolver() {
        final TilesViewResolver tilesViewResolver = new TilesViewResolver();
        tilesViewResolver.setViewClass(TilesView.class);
        return tilesViewResolver;
    }
}
