-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_bek_rom is 
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


architecture rtl of predict_ensemble_bek_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 to 2=> "0", 3 => "1", 4 => "0", 5 to 7=> "1", 8 to 10=> "0", 11 => "1", 12 to 14=> "0", 
    15 to 19=> "1", 20 to 22=> "0", 23 to 24=> "1", 25 to 27=> "0", 28 => "1", 29 to 31=> "0", 32 to 34=> "1", 
    35 => "0", 36 to 37=> "1", 38 to 40=> "0", 41 to 42=> "1", 43 => "0", 44 => "1", 45 => "0", 
    46 to 47=> "1", 48 to 49=> "0", 50 to 51=> "1", 52 to 54=> "0", 55 => "1", 56 => "0", 57 => "1", 
    58 => "0", 59 => "1", 60 to 61=> "0", 62 to 65=> "1", 66 => "0", 67 => "1", 68 to 71=> "0", 
    72 to 75=> "1", 76 to 80=> "0", 81 to 82=> "1", 83 to 84=> "0", 85 to 86=> "1", 87 to 88=> "0", 89 to 92=> "1", 
    93 to 95=> "0", 96 => "1", 97 to 98=> "0", 99 to 100=> "1", 101 to 102=> "0", 103 to 104=> "1", 105 to 107=> "0", 
    108 to 109=> "1", 110 to 117=> "0", 118 => "1", 119 => "0", 120 => "1", 121 => "0", 122 => "1", 
    123 to 126=> "0", 127 => "1", 128 => "0", 129 => "1", 130 to 131=> "0", 132 => "1", 133 to 134=> "0", 
    135 to 137=> "1", 138 to 142=> "0", 143 => "1", 144 to 145=> "0", 146 to 148=> "1", 149 => "0", 150 to 153=> "1", 
    154 => "0", 155 to 160=> "1", 161 to 162=> "0", 163 => "1", 164 to 165=> "0", 166 to 172=> "1", 173 => "0", 
    174 to 180=> "1", 181 to 182=> "0", 183 to 186=> "1", 187 to 194=> "0" );

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

entity predict_ensemble_bek is
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

architecture arch of predict_ensemble_bek is
    component predict_ensemble_bek_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_bek_rom_U :  component predict_ensemble_bek_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


