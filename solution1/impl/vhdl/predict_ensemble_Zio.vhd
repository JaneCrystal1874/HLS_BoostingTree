-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_Zio_rom is 
    generic(
             DWIDTH     : integer := 1; 
             AWIDTH     : integer := 8; 
             MEM_SIZE    : integer := 195
    ); 
    port (
          addr0      : in std_logic_vector(AWIDTH-1 downto 0); 
          ce0       : in std_logic; 
          q0         : out std_logic_vector(DWIDTH-1 downto 0);
          clk       : in std_logic
    ); 
end entity; 


architecture rtl of predict_ensemble_Zio_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 to 2=> "0", 3 to 4=> "1", 5 to 6=> "0", 7 to 9=> "1", 10 to 12=> "0", 13 to 15=> "1", 16 to 18=> "0", 
    19 to 21=> "1", 22 to 23=> "0", 24 => "1", 25 to 27=> "0", 28 => "1", 29 to 32=> "0", 33 to 35=> "1", 
    36 to 38=> "0", 39 to 40=> "1", 41 to 42=> "0", 43 => "1", 44 to 45=> "0", 46 => "1", 47 => "0", 
    48 to 49=> "1", 50 to 52=> "0", 53 to 56=> "1", 57 => "0", 58 to 59=> "1", 60 to 61=> "0", 62 => "1", 
    63 => "0", 64 to 65=> "1", 66 to 71=> "0", 72 => "1", 73 to 74=> "0", 75 => "1", 76 to 77=> "0", 
    78 to 85=> "1", 86 => "0", 87 => "1", 88 to 90=> "0", 91 => "1", 92 => "0", 93 to 94=> "1", 
    95 => "0", 96 => "1", 97 => "0", 98 => "1", 99 to 100=> "0", 101 => "1", 102 => "0", 
    103 => "1", 104 => "0", 105 => "1", 106 to 107=> "0", 108 => "1", 109 => "0", 110 => "1", 
    111 to 112=> "0", 113 to 118=> "1", 119 => "0", 120 to 122=> "1", 123 to 124=> "0", 125 => "1", 126 => "0", 
    127 => "1", 128 => "0", 129 to 131=> "1", 132 to 134=> "0", 135 to 136=> "1", 137 to 142=> "0", 143 => "1", 
    144 => "0", 145 => "1", 146 to 147=> "0", 148 to 150=> "1", 151 to 152=> "0", 153 => "1", 154 => "0", 
    155 to 158=> "1", 159 => "0", 160 to 161=> "1", 162 to 164=> "0", 165 to 168=> "1", 169 to 170=> "0", 171 => "1", 
    172 to 174=> "0", 175 to 176=> "1", 177 => "0", 178 to 182=> "1", 183 to 194=> "0" );

attribute syn_rom_style : string;
attribute syn_rom_style of mem : signal is "select_rom";
attribute ROM_STYLE : string;
attribute ROM_STYLE of mem : signal is "distributed";

begin 


memory_access_guard_0: process (addr0) 
begin
      addr0_tmp <= addr0;
--synthesis translate_off
      if (CONV_INTEGER(addr0) > mem_size-1) then
           addr0_tmp <= (others => '0');
      else 
           addr0_tmp <= addr0;
      end if;
--synthesis translate_on
end process;

p_rom_access: process (clk)  
begin 
    if (clk'event and clk = '1') then
        if (ce0 = '1') then 
            q0 <= mem(CONV_INTEGER(addr0_tmp)); 
        end if;
    end if;
end process;

end rtl;

Library IEEE;
use IEEE.std_logic_1164.all;

entity predict_ensemble_Zio is
    generic (
        DataWidth : INTEGER := 1;
        AddressRange : INTEGER := 195;
        AddressWidth : INTEGER := 8);
    port (
        reset : IN STD_LOGIC;
        clk : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR(AddressWidth - 1 DOWNTO 0);
        ce0 : IN STD_LOGIC;
        q0 : OUT STD_LOGIC_VECTOR(DataWidth - 1 DOWNTO 0));
end entity;

architecture arch of predict_ensemble_Zio is
    component predict_ensemble_Zio_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_Zio_rom_U :  component predict_ensemble_Zio_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


