<form action="${req.servicesBase}/styles/create" class="ajax-form" method="POST">
    <input type="hidden" name="filters" value="${req.params.filters!}"/>
    <input name="type" value="${req.params.type!}" type="hidden">

    <label>Color: </label>
    <input type="color" name="color" value="${req.params.color!}" type="text">

    <div style="text-align: right;">
      <input type="submit" name="Save" value="Save">
      <input type="submit" name="Cancel" class="exit" value="Cancel">
    </div>
</form>
