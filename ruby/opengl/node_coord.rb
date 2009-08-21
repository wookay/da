require 'opengl'
require 'node'

class Coord
  def initialize
  end

  def update
  end

  def draw
    glPushMatrix
      glTranslatef(0, 0, -30)
      glBegin(GL_LINES)
        glColor3f(1.0, 0.0, 0.0)
        glVertex3f(0.0, 0.0, 0.0)
        glVertex3f(10.0, 0.0, 0.0)
      glEnd()
      glBegin(GL_LINES)
        glColor3f(0.0, 1.0, 0.0)
        glVertex3f(0.0, 0.0, 0.0)
        glVertex3f(0.0, 10.0, 0.0)
      glEnd()
      glBegin(GL_LINES)
        glColor3f(0.0, 0.0, 1.0)
        glVertex3f(0.0, 0.0, 0.0)
        glVertex3f(0.0, 0.0, 30.0)
      glEnd()
    glPopMatrix
  end
end
