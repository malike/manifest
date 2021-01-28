package st.malike.manifest.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.stereotype.Service;
import st.malike.manifest.repository.DataRepository;

/**
 * @author malike_st
 */
@Service
public class DataService {

  @Autowired
  private DataRepository dataRepository;
  @Autowired
  private MongoTemplate mongoTemplate;

}
