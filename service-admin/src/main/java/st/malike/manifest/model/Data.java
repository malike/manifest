package st.malike.manifest.model;

import java.io.Serializable;

/**
 * @author malike_st
 */
@Document(collection="manifest_data")
public class Data implements Serializable {

    @Id
    private String id;
    @Indexed
    private String party;
    private String section;
    private String description;
    @Indexed
    private List<String> tags;
    @Indexed
    private Date dateCreated;

}
