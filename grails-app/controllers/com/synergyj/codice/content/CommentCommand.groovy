package com.synergyj.codice.content

class CommentCommand {
	String author
	String textComment
	String mail
	Date creationDate = new Date()
	Boolean notifyResponses
	Integer contentId
	
	static constraints = {
		author blank:false,maxSize:128
		textComment blank:false,maxSize:10000
		mail email:true,blank:false
	}
}
