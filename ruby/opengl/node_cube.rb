require 'opengl'
require 'node'

class Cube
  def initialize
    @translate = Vector3.new -10.0, -10.0, -50.0
  end

  def update
    @translate.bound :z, 0.5, -80..-50
  end

  def draw
    glEnable(GL_LIGHTING) # enable lighting
    glEnable(GL_LIGHT0) # enable light #0
    glEnable(GL_LIGHT1) # enable light #1
    glTranslatef(@translate.x, @translate.y, @translate.z)
    glBegin(GL_QUADS)
      glColor3f(1.0, 1.0, 0.0)
      glNormal3f(1.0, 0.0, -1.0)
      glVertex3f(-2.0, -2.0, 2.0)
      glNormal3f(1.0, 0.0, -1.0)
      glVertex3f(2.0, -2.0, 2.0)
      glNormal3f(1.0, 0.0, 1.0)
      glVertex3f(2.0, 2.0, 2.0)
      glNormal3f(1.0, 0.0, 1.0)
      glVertex3f(-2.0, 2.0, 2.0)
      
      glColor3f(1.0, 0.0, 0.0)
      glNormal3f(1.0, 0.0, -1.0)
      glVertex3f(2.0, -2.0, -2.0)
      glNormal3f(1.0, 0.0, 1.0)
      glVertex3f(2.0, 2.0, -2.0)
      glNormal3f(1.0, 0.0, -1.0)
      glVertex3f(2.0, 2.0, 2.0)
      glNormal3f(1.0, 0.0, 1.0)
      glVertex3f(2.0, -2.0, 2.0)
      
      glColor3f(0.0, 1.0, 0.0)
      glVertex3f(-2.0, -2.0, -2.0)
      glVertex3f(-2.0, 2.0, -2.0)
      glVertex3f(2.0, 2.0, -2.0)
      glVertex3f(2.0, -2.0, -2.0)
      
      glColor3f(0.0, 1.0, 1.0)
      glVertex3f(-2.0, -2.0, -2.0)
      glVertex3f(-2.0, -2.0, 2.0)
      glVertex3f(-2.0, 2.0, 2.0)
      glVertex3f(-2.0, 2.0, -2.0)
      
      glColor3f(0.0, 0.0, 1.0)
      glVertex3f(2.0, 2.0, 2.0)
      glVertex3f(2.0, 2.0, -2.0)
      glVertex3f(-2.0, 2.0, -2.0)
      glVertex3f(-2.0, 2.0, 2.0)
    glEnd()
  end
end
