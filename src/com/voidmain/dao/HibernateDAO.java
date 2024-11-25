package com.voidmain.dao;

import java.util.List;
import com.voidmain.pojo.Food;
import com.voidmain.pojo.FoodRequest;
import com.voidmain.pojo.Login;
import com.voidmain.pojo.User;
import com.voidmain.pojo.Message;

public class HibernateDAO {

	public static String isValidUser(String username,String password)
	{
		String role="";
		
		System.out.println("Logins:"+username+"\t"+password);
		
		Login login=getLoginById(username);

		if(login!=null && login.getPassword().equals(password))
		{
			role=login.getRole();
		}
		
		System.out.println("Role:"+role);
		
		return role;
	}

	public static boolean isUserRegistred(String username)
	{
		boolean isRegistred=false;

		for(Login login : getLogins())
		{
			System.out.println("Logins:"+login.getUsername()+"\t"+login.getPassword());
			if(login.getUsername().toLowerCase().equals(username.toLowerCase()))
			{
				isRegistred=true;

				break;
			}
		}

		return isRegistred;
	}

	//================================================================================

	public static Login getLoginById(String username)
	{
		System.out.println("username:"+username);
		
		return (Login)HibernateTemplate.getObject(Login.class,username);
	}

	public static int deleteLogin(String username)
	{
		return HibernateTemplate.deleteObject(Login.class,username);
	}

	public static List<Login> getLogins()
	{
		List<Login> logins=(List)HibernateTemplate.getObjectListByQuery("From Login");

		return logins;
	}

	//============================================================================

	public static User getUserById(String username)
	{
		return (User)HibernateTemplate.getObject(User.class,username);
	}

	public static int deleteUser(String username)
	{
		return HibernateTemplate.deleteObject(User.class,username);
	}

	public static List<User> getUsers()
	{
		List<User> users=(List)HibernateTemplate.getObjectListByQuery("From User");

		return users;
	}

	//================================================================================

	public static Food getFoodById(int id)
	{
		return (Food)HibernateTemplate.getObject(Food.class,id);
	}

	public static int deleteFood(int id)
	{
		return HibernateTemplate.deleteObject(Food.class,id);
	}

	public static List<Food> getFoods()
	{
		List<Food> foods=(List)HibernateTemplate.getObjectListByQuery("From Food");

		return foods;
	}

	//================================================================================

	public static FoodRequest getFoodRequestById(int id)
	{
		return (FoodRequest)HibernateTemplate.getObject(FoodRequest.class,id);
	}

	public static int deleteFoodRequest(int id)
	{
		return HibernateTemplate.deleteObject(FoodRequest.class,id);
	}

	public static List<FoodRequest> getFoodRequests()
	{
		List<FoodRequest> foodRequests=(List)HibernateTemplate.getObjectListByQuery("From FoodRequest");

		return foodRequests;
	}
	
	//================================================================================
	public static Message getMessageById(int id)
	{
		return (Message)HibernateTemplate.getObject(Message.class,id);
	}

	public static int deleteMessage(int id)
	{
		return HibernateTemplate.deleteObject(Message.class,id);
	}

	public static List<Message> getMessages()
	{
		List<Message> messages=(List)HibernateTemplate.getObjectListByQuery("From Message");

		return messages;
	}
}
