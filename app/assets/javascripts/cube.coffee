# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$('.cube.show').ready ->
  $.ajax("/cube.json").done (c) ->
    console.log c
    scene = new (THREE.Scene)
    camera = new (THREE.PerspectiveCamera)(75, window.innerWidth / window.innerHeight, 0.1, 1000)
    renderer = new (THREE.WebGLRenderer)
    renderer.setSize window.innerWidth, window.innerHeight
    renderer.setClearColor( 0xffffff, 0);
    document.body.appendChild renderer.domElement
    geometry = new (THREE.BoxGeometry)(3, 3, 3)
    materials = []
    images = $.ajax("/images.json").done (urls) ->
      window.urls = urls
      for url in urls
        console.log(url)
        img = new Image
        img.src = url
        tex = new (THREE.Texture)(img)
        img.tex = tex

        img.onload = ->
          @tex.needsUpdate = true
          return

        mat = new (THREE.MeshBasicMaterial)(
          map: tex
          transparent: true
          overdraw: true)
        materials.push mat
    cube = new (THREE.Mesh)(geometry, new (THREE.MeshFaceMaterial)(materials))
    scene.add cube
    camera.position.z = 5


    name = '/white_beach_and_blue_sky.jpg'
    # Load the background texture
    texture = THREE.ImageUtils.loadTexture(name)
    backgroundMesh = new (THREE.Mesh)(new (THREE.PlaneGeometry)(2, 2, 0), new (THREE.MeshBasicMaterial)(map: texture))
    backgroundMesh.material.depthTest = false
    backgroundMesh.material.depthWrite = false
    # Create your background scene
    backgroundScene = new (THREE.Scene)
    backgroundCamera = new (THREE.Camera)
    backgroundScene.add backgroundCamera
    backgroundScene.add backgroundMesh




    render = ->
      requestAnimationFrame render
      cube.rotation.x += c.cubex
      cube.rotation.y += c.cubey
      cube.rotation.z += c.cubez
      renderer.autoClear = false
      renderer.clear()
      renderer.render backgroundScene, backgroundCamera
      renderer.render scene, camera
      return

    render()

# ---
# generated by js2coffee 2.1.0

$('.images.index').ready ->
  cubeFromInput = (cube) ->
    cube.rotation.x += 1*$('.cubex').val()
    cube.rotation.y += 1*$('.cubey').val()
    cube.rotation.z += 1*$('.cubez').val()
  scene = new (THREE.Scene)
  camera = new (THREE.PerspectiveCamera)(75, window.innerWidth / window.innerHeight, 0.1, 1000)
  renderer = new (THREE.WebGLRenderer)
  renderer.setSize 200, 200
  renderer.setClearColor( 0xffffff, 0);
  $('.preview').append renderer.domElement
  geometry = new (THREE.BoxGeometry)(2, 2, 2)
  materials = []
  images = $.ajax("/images.json").done (urls) ->
    window.urls = urls
    if urls?
      for url in urls
        console.log(url)
        img = new Image
        img.src = url
        tex = new (THREE.Texture)(img)
        img.tex = tex

        img.onload = ->
          @tex.needsUpdate = true
          return

        mat = new (THREE.MeshBasicMaterial)(
          map: tex
          transparent: true
          overdraw: true)
        materials.push mat
      cube = new (THREE.Mesh)(geometry, new (THREE.MeshFaceMaterial)(materials))
      scene.add cube
      camera.position.z = 5

      render = ->
        requestAnimationFrame render
        cubeFromInput(cube)
        renderer.render scene, camera
        return

      render()
