import java.time.LocalDate
import java.time.LocalDateTime
import java.time.Duration

class Gigasecond(date: LocalDateTime) {

  val date: LocalDateTime = date.plus(Duration.ofSeconds(1000000000))
    get

  constructor(date: LocalDate) : this(date.atStartOfDay()) {}
}
