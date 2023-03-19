<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Create</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
</head>
<body>
<div class="container w-75 m-auto">
    <h2 class="mt-5 mb-2">Create new person</h2>
    <form action="person" method="post">
        <div>
            <label>
                New Person
                <input name="personId" type="text">
            </label>
        </div>
        <div>
            <fieldset>
                <legend>Your phone</legend>
                <label>Number(s):
                    <input name="numbers" type="text" readonly class="border-0">
                </label>
            </fieldset>
        </div>
        <div>
            <fieldset>
                <legend>Add more phone</legend>
                <label>Number:
                    <input name="number" type="text">
                </label>
                <label>
                    <input type="button" id="btnNumber" value="Add">
                </label>
            </fieldset>
        </div>

        <br>
        <input type="submit" name="action" value="create">
    </form>
</div>
</body>
</html>
<script src="index.js"></script>
