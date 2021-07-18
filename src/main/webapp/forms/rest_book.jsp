<%@page import="com.web.rest.bookstore.BookDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Book</title>
        <link rel="stylesheet" href="https://unpkg.com/purecss@2.0.6/build/pure-min.css">
        <script>
            // 較新的瀏覽器中已經有提供btoa和atob兩個全域函式，可以用來做base64的encode和decode
            function updateBook(str) {
                console.log(atou(str));
                var book = JSON.parse(atou(str))
                alert(book.name);
            }
            // https://kknews.cc/zh-tw/code/5z5z6kl.html
            // 為什麼 escape 可以使 btoa 正確處理 UTF-8 編碼的字符串？   
            // 使用utf-8字符集进行base64编码
            function utoa(str) {
                return window.btoa(unescape(encodeURIComponent(str)));
            }
            // 使用utf-8字符集解析base64字符串 
            function atou(str) {
                return decodeURIComponent(escape(window.atob(str)));
            }
        </script>
    </head>
    <body style="padding: 20px">
        <form class="pure-form">
            <fieldset>
                <legend>Rest Book List</legend>
                <table class="pure-table pure-table-bordered">
                    <thead>
                        <tr>
                            <th>id</th>
                            <th>name</th>
                            <th>price</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="book" items="${ BookDao.books }">
                            <tr onclick='updateBook("${ book }")' style="cursor:default">
                                <td>${ book.id }</td>
                                <td>${ book.name }</td>
                                <td>${ book.price }</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>

            </fieldset>
        </form>

        <table>
            <td valign="top">
                <form class="pure-form"
                      method="post" action="/JavaWeb0531/rest/book">
                    <fieldset>
                        <legend>Rest Book POST</legend>
                        <input name="id" type="text" placeholder="id"><p /> 
                        <input name="name" type="text" placeholder="名稱"><p /> 
                        <input name="price" type="text" placeholder="價格"><p />
                        <p />
                        <button type="submit" 
                                class="pure-button pure-button-primary">新增</button>

                    </fieldset>
                </form>
            </td>
            <td valign="top">
                <form class="pure-form"
                      method="post" action="/JavaWeb0531/rest/book">
                    <fieldset>
                        <legend>Rest Book PUT</legend>
                        <input name="_method" type="hidden" value="PUT" />
                        <input name="id" type="text" placeholder="id"><p /> 
                        <input name="name" type="text" placeholder="名稱"><p /> 
                        <input name="price" type="text" placeholder="價格"><p />
                        <p />
                        <button type="submit" 
                                class="pure-button pure-button-primary">修改</button>

                    </fieldset>
                </form>
            </td>
            <td valign="top">
                <form class="pure-form"
                      method="post" action="/JavaWeb0531/rest/book">
                    <fieldset>
                        <legend>Rest Book Delete</legend>
                        <input name="_method" type="hidden" value="DELETE" />
                        <input name="id" type="text" placeholder="id"><p /> 
                        <p />
                        <button type="submit" 
                                class="pure-button pure-button-primary">刪除</button>

                    </fieldset>
                </form>    
            </td>
        </table>
    </body>
</html>
