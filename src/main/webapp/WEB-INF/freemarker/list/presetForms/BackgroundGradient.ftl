<form action="${req.servicesBase}/styles/create" class="ajax-form" method="POST">
    <input type="hidden" name="filters" value="${req.params.filters!}"/>
    <input name="type" value="${req.params.type!}" type="hidden">

    <label>Start Color: </label>
    <input type="color" name="color1" value="${req.params.color1!}" type="text">
    <label style="margin-left: 30px;">End Color: </label>
    <input type="color" name="color2" value="${req.params.color2!}" type="text">

    <div style="text-align: right;">
      <input type="submit" name="Save" value="Save">
      <input type="submit" name="Cancel" class="exit" value="Cancel">
    </div>
</form>
