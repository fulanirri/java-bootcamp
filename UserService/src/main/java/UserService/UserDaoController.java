package UserService;

import Model.Photo;
import Model.User;
import java.util.ArrayList;
import javax.annotation.Resource;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import java.util.concurrent.atomic.AtomicInteger;

/**
 *
 * @author german
 */
@RestController
public class UserDaoController  {
    
    @Resource
    private UserDao userDao;
    
    private AtomicInteger userCounter = new AtomicInteger();
    
    
    
    @RequestMapping("/getallusers")
    public ArrayList<User> getAllUsers() {
       return userDao.getAllUsers();
    }

    
    @RequestMapping("/adduser")
    public void addUser(@RequestParam(value="name")String name,
        @RequestParam(value="password")String password) {
        
 
        User user = new User(userCounter.incrementAndGet(),name,password);        
        userDao.addUser(user);
    }

    @RequestMapping("/deleteuser")
    public void deleteUser(@RequestParam(value="id")int id) {
        userDao.deleteUser(id);
    }

    @RequestMapping("/update")
    public void updateUser(@RequestParam(value="id") int id,
                            @RequestParam(value="name")String name) {
        userDao.updateUser(id,name);
    }
    
    @RequestMapping("/addphoto")
    public void addPhoto(@RequestParam(value="id") int id,
            @RequestParam(value="uri")String uri) {
      
        userDao.addPhoto(id,uri);
    }
    
    @RequestMapping("/addfriend")
    public void addFriend(@RequestParam(value="iduser") int idUser,
            @RequestParam(value="idfriend")int idFriend) {
      
        userDao.addFriend(idUser,idFriend);
    }
    
    
    @RequestMapping("/likePic")
    public void likeToUserPhoto(@RequestParam(value="id")int id, 
            @RequestParam(value="idpic")int idPhoto) {
            userDao.likeToUserPhoto(id, idPhoto);
    }
    
    
    

}
