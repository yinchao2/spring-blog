package com.spring.blog.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBElement;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Unmarshaller;
import javax.xml.transform.Source;

import com.spring.blog.entity.Item;
import com.spring.blog.exception.RssException;
import com.spring.blog.rss.ObjectFactory;
import com.spring.blog.rss.TRss;
import com.spring.blog.rss.TRssChannel;
import com.spring.blog.rss.TRssItem;

public class RssService {
	
	public List<Item> getItem(Source source) throws RssException {
		
		List<Item> list = new ArrayList<Item>();
		
		try{
			JAXBContext jaxbcontext = JAXBContext.newInstance(ObjectFactory.class);
			Unmarshaller unmarshaller = jaxbcontext.createUnmarshaller(); // convert xml to java object
			JAXBElement<TRss> jaxbElement = unmarshaller.unmarshal(source, TRss.class);
			TRss rss = jaxbElement.getValue();
			
			List<TRssChannel> channels = rss.getChannel();
			for(TRssChannel channel: channels) {
				List<TRssItem> items = channel.getItem();
				for(TRssItem rssItem: items) {
					Item item = new Item();
					item.setTitle(rssItem.getTitle());
					item.setDescription(rssItem.getDescription());
					item.setLink(rssItem.getLink());
					Date pubDate = new SimpleDateFormat("EEE, dd MMM yyyy HH:mm:ss Z", Locale.ENGLISH).parse(rssItem.getPubDate());
					item.setPublishedDate(pubDate);
					list.add(item);
				}
			}
		} catch(JAXBException e) {
			throw new RssException(e);
		} catch(ParseException e) {
			throw new RssException(e);
		}
		
		return list;
	}
	
}
