package com.spring.blog.service;

import static org.junit.Assert.assertEquals;

import java.text.SimpleDateFormat;
import java.util.List;

import org.junit.Before;
import org.junit.Test;

import com.spring.blog.entity.Item;
import com.spring.blog.exception.RssException;

public class RssServiceTest {
	
	private RssService rssService;

	@Before
	public void setUp() throws Exception {
		rssService = new RssService();
	}

	@Test
	public void testGetItemsFile() throws RssException {
		List<Item> items = rssService.getItems("test-rss/rss.xml");
		assertEquals(20, items.size());
		Item firstItem = items.get(0);
		assertEquals("ប្រមុខក្រសួង​ស៊ើបការណ៍សម្ងាត់​ប៉ាគីស្ថាន​ទៅ​ទស្សនកិច្ច​នៅ​អាមេរិក", firstItem.getTitle());
		assertEquals("25 02 2015 09:05:08", new SimpleDateFormat("dd MM yyyy HH:mm:ss").format(firstItem.getPublishedDate()));
		
	}

}
