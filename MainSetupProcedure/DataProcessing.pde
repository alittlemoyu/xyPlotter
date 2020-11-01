//在PC端進行數據處理，得到直綫的起始点、終點，運行速度、運行步數。由於不能靠baud率極低的串口傳輸曲綫每一步的驅動量，曲綫的處理直接在Arduino端進行。
//首先計算直綫的驅動數據。

class LineDrive {
  float start;
  float end;
  float speed;
  float step;
}
