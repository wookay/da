require 'opengl'
require 'node'

module Scene
  def load_nodes
    require 'node_cube'
    require 'node_cube2'
    require 'node_cube3'
    require 'node_coord'
    @nodes = [Cube.new, Cube2.new, Cube3.new, Coord.new]
  end

  def draw_nodes &block
    glClear GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT

    glMatrixMode GL_PROJECTION
    glLoadIdentity
    gluPerspective(15, 1, 1.0, 200.0)
    glTranslate(-10, -10, -90)

    @nodes.each do |node|
      glPushMatrix
      node.draw
      glPopMatrix
    end

    glutSwapBuffers
  end

  def update_nodes
    @nodes.each do |node|
      node.update
    end
    glutPostRedisplay
  end
end
