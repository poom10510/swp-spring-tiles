<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<code>
import { getSectionsDB, addSection, addTodoItem } from 'javascripts/firebase'
import actionType from 'constants'
import {push} from 'react-router-redux'

export const loadSections = () => {
	return dispatch => {
		dispatch({
			type: actionType.LOAD_SECTIONS_REQUEST
		})
    getSectionsDB()
      .then(sections => {
        dispatch({
          type: actionType.LOAD_SECTIONS_SUCCESS,
          payload: sections.val()
        })
      })
      .catch(error => {
        dispatch({
          type: actionType.LOAD_SECTIONS_FAILED,
          payload: error
        })
      })
	}
}

export const createSection = (name) => {
	return dispatch => {
		dispatch({
			type: actionType.ADD_SECTION_REQUEST
		})
		addSection(name)
			.then(res => {
        loadSections()(dispatch)
				dispatch({
					type: actionType.ADD_SECTION_SUCCESS
				})
			})
			.catch(error => {
				dispatch({
					type: actionType.ADD_SECTION_FAILED,
					payload: error
				})
			})
	}
}

export const createTodoItem = (sectionId, name) => {
  return (dispatch) => {
    dispatch({
      type: actionType.CREATE_TODO_REQUEST
    })
    addTodoItem(sectionId, name)
      .then(res => {
        loadSections()(dispatch)
        dispatch({
          type: actionType.CREATE_TODO_SUCCESS,
          payload: res
        })
      })
      .catch(error => {
        dispatch({
          type: actionType.CREATE_TODO_FAILED,
          payload: error
        })
      })
   }
}

export const loadSpecificSection = (sectionId) => {
  return (dispatch) => {
    dispatch(push(`/${sectionId}`))
  }
}
	</code>
</body>
</html>