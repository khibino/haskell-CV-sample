
import CV.Image (loadColorImage, saveImage, getRegion)
import CV.Transforms (scale, scaleToSize, Interpolation(..))

resizeImageFile :: FilePath -> (Double, Double) -> FilePath -> IO()
resizeImageFile from (sx, sy) to =
  do mayImg <- loadColorImage from
     case mayImg of
       Nothing  -> return ()
       Just img -> saveImage to (scale Linear (sx, sy) img)

cropImageFile :: FilePath -> (Int, Int) -> (Int, Int) -> FilePath -> IO ()
cropImageFile from leftTop size to =
  do mayImg <- loadColorImage from
     case mayImg of
       Nothing  -> return ()
       Just img -> saveImage to (getRegion leftTop size img)

main = undefined