"""Stamp class."""


class Stamp:
    """Stamp class for storing details of a Stamp."""

    def __init__(self, country="", denomination=0, is_rare=False):
        """Initialise a Stamp."""
        self.country = country
        self.denomination = denomination
        self.is_rare = is_rare

    def __str__(self):
        """Return a string representation of a Stamp."""
        return "{} ${:,.2f} ({})".format(self.country, self.denomination, self.is_rare)

    def __lt__(self, other):
        """Less than, used for sorting Stamps - by denomination."""
        return self.denomination < other.denomination
