package st.malike.manifest.repository;

import org.springframework.data.mongodb.repository.MongoRepository;
import st.malike.manifest.model.Data;

/**
 * @author malike_st
 */
public interface DataRepository extends MongoRepository<Data, String> {

}


