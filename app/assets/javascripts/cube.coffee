# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'ready page:load', ->
  scene = new (THREE.Scene)
  camera = new (THREE.PerspectiveCamera)(75, window.innerWidth / window.innerHeight, 0.1, 1000)
  renderer = new (THREE.WebGLRenderer)
  renderer.setSize window.innerWidth, window.innerHeight
  renderer.setClearColor( 0xffffff, 0);
  document.body.appendChild renderer.domElement
  geometry = new (THREE.BoxGeometry)(3, 3, 3)
  materials = []
  images = $.ajax("/images.json").done (urls) ->
    console.log(urls)
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
    cube.rotation.x += 3* 0.001
    cube.rotation.y += 3* 0.01
    cube.rotation.z += 3* 0.001
    renderer.render scene, camera
    return

  render()

# ---
# generated by js2coffee 2.1.0
